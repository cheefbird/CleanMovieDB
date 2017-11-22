//
//  RealmMovieService.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/7/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RealmSwift

class RealmMovieService: MovieServiceType {
  
  func getMovies(forPage page: Int?, completionHandler: @escaping MoviesResult) {
    let realm = try! Realm()
    
    let movies = realm.objects(RealmMovie.self).sorted(byKeyPath: "voteAverage", ascending: false)
    
    completionHandler(Array(movies), nil)
  }
  
  func getReviews(forMovie movie: MovieObject, completionHandler: @escaping ReviewsResult) {
    let realm = try! Realm()
    
    let reviews = realm.objects(RealmReview.self).filter("movie == %@", movie)
    
    completionHandler(Array(reviews), nil)
  }
  
  func getFavoriteStatus(forMovie movie: MovieObject) -> Bool {
    let realm = try! Realm()
    
    let user = RealmUser.defaultUser(inRealm: realm)
    let savedMovies = user.favoriteMovies
    
    guard savedMovies.count > 0 else { return false }
    
    for item in savedMovies {
      if movie.id == item.id {
        return true
      }
    }
    
    return false
  }
  
}
