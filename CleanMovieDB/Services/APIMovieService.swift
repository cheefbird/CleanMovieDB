//
//  APIMovieService.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/7/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RealmSwift

class APIMovieService: MovieServiceType {
  
  func getMovies(forPage page: Int?, completionHandler: @escaping MoviesResult) {
    guard let page = page else { return }
    
    Alamofire.request(MoviesRouter.getMovies(page: page))
      .responseArray(keyPath: "results") { (response: DataResponse<[Movie]>) in
        
        guard response.result.error == nil else {
          completionHandler([], response.result.error!)
          print("ERROR: ERROR occurred when requesting page \(page) of movies")
          return
        }
        
        guard let movieArray = response.result.value else {
          completionHandler([], nil)
          print("ERROR: ERROR occurred when setting response value to property")
          return
        }
        
        self.persist(movies: movieArray)
        
        completionHandler(movieArray, nil)
        
    }
  }
  
  fileprivate func persist(movies: [MovieObject]) {
    let newMovies = movies.map { RealmMovie(copy: $0) }
    
    let realm = try! Realm()
    try! realm.write {
      realm.add(newMovies, update: true)
    }
  }
  
  func getReviews(forMovie movie: MovieObject, completionHandler: @escaping ReviewsResult) {
    let movieID = movie.id
    
    Alamofire.request(MoviesRouter.getReview(id: movieID))
      .responseArray(keyPath: "results") { (response: DataResponse<[Review]>) in
        
        guard response.result.error == nil else {
          completionHandler([], response.result.error!)
          print("Error: \(response.result.error!.localizedDescription)")
          return
        }
        
        guard let reviews = response.result.value else {
          completionHandler([], MoviesAPIError.serializationError(reason: "Unable to serialize reviews response"))
          print("Error serializing reviews response")
          return
        }
        
        
        self.persist(reviews: reviews, forMovieID: movieID)
        
        completionHandler(reviews, nil)
    }
  }
  
  fileprivate func persist(reviews: [ReviewObject], forMovieID id: Int) {
    let newReviews = reviews.map { RealmReview(copyFrom: $0) }
    
    let realm = try! Realm()
    guard let movie = realm.object(ofType: RealmMovie.self, forPrimaryKey: id) else { return }
    
    try!realm.write {
      for review in newReviews {
        realm.add(review, update: true)
        
        movie.reviews.forEach { savedReview in
          if review.id != savedReview.id {
            movie.reviews.append(review)
          }
        }
      }
    }
    
  }
  
  func getFavoriteStatus(forMovie movie: MovieObject) -> Bool {
    return false
  }
  
}










