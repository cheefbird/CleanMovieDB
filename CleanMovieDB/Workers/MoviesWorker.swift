//
//  MoviesWorker.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 10/31/17.
//  Copyright (c) 2017 Francis Breidenbach. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation
import Alamofire
import ObjectMapper

protocol MoviesWorkerType {
  
  func fetchMovies(forPage page: Int?, completionHandler: @escaping MoviesResult)

}


class MoviesWorker: MoviesWorkerType {

  var realmService: MovieServiceType
  var apiService: MovieServiceType
  
  init(realmService: MovieServiceType, apiService: MovieServiceType) {
    self.realmService = realmService
    self.apiService = apiService
  }
  
  func fetchMovies(forPage page: Int?, completionHandler: @escaping MoviesResult) {
    
    guard let page = page, page > 0 else {
      print("Fetching from Realm ...")
      realmService.getMovies(forPage: 0, completionHandler: completionHandler)
      return
    }
    
    print("Fetching from API ...")
    apiService.getMovies(forPage: page, completionHandler: completionHandler)
    
  }
  
  func fetchReviews(forMovie movie: MovieObject, completionHandler: @escaping ReviewsResult) {
    
    apiService.getReviews(forMovie: movie, completionHandler: completionHandler)
    
  }

}
