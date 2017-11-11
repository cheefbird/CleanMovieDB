//
//  MovieImageType.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/7/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation

enum MovieImageType {
  
  case poster
  case backdrop
  
  var dimensions: String {
    switch self {
    case .poster:
      return "w500"
      
    case .backdrop:
      return "w780"
    }
  }
}
