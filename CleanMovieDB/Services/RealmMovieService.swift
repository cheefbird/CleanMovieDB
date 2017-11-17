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
  
  func getReview(forMovie movie: MovieObject, completionHandler: @escaping ReviewResult) {
    
  }
  
}
