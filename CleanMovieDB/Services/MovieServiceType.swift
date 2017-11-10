//
//  MovieServiceType.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/7/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation

typealias MoviesResult = (_ movies: [MovieObject], _ error: Error?) -> Void

protocol MovieServiceType {
  
  func getMovies(forPage page: Int?, completionHandler: @escaping MoviesResult)
  
}
