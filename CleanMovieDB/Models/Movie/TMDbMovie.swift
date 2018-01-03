//
//  Movie.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 10/31/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import ObjectMapper


class TMDbMovie: Movie, Mappable {
  var id = 0
  var title = ""
  var summary = ""
  var popularity = 0.0
  var voteAverage = 0.0
  var posterImagePath = ""
  var backdropImagePath = ""
  
  // MARK: - Init
  
  required init?(map: Map) {
    
  }
  
  // Mappable
  
  func mapping(map: Map) {
    id                  <- map["id"]
    title               <- map["original_title"]
    summary             <- map["overview"]
    popularity          <- map["popularity"]
    voteAverage         <- map["vote_average"]
    posterImagePath     <- map["poster_path"]
    backdropImagePath   <- map["backdrop_path"]
  }
  
}

// MARK: - Equatable

extension TMDbMovie: Equatable {
  
  static func ==(lhs: TMDbMovie, rhs: TMDbMovie) -> Bool {
    return lhs.id == rhs.id
      && lhs.popularity == rhs.popularity
      && lhs.voteAverage == rhs.voteAverage
  }
}











