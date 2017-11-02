//
//  Movie.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 10/31/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import ObjectMapper


class Movie: Mappable {
  var id: Int?
  var title: String?
  var summary: String?
  var popularity: Double?
  var voteAverage: Double?
  
  required init?(map: Map) {
    
  }
  
  // Mappable
  
  func mapping(map: Map) {
    id            <- map["id"]
    title         <- map["original_title"]
    summary       <- map["overview"]
    popularity    <- map["popularity"]
    voteAverage   <- map["vote_average"]
  }
  
  
}

// MARK: - Equatable

extension Movie: Equatable {
  
  static func ==(lhs: Movie, rhs: Movie) -> Bool {
    return lhs.id == rhs.id
      && lhs.popularity == rhs.popularity
      && lhs.voteAverage == rhs.voteAverage
  }
  
}
