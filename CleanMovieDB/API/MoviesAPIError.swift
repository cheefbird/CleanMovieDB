//
//  MoviesAPIError.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/1/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation


enum MoviesAPIError: Error {
  
  case network(error: Error)
  case serializationError(reason: String)
  
}
