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
  var releaseDate = Date()
  
  // MARK: - Stored Properties

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
    
    let dateTransform = TransformOf<Date, String>(
      fromJSON: { (dateString) -> Date? in
        guard let dateString = dateString else { return nil }
        
        let formatter = ReleaseDateFormatter.dateFormatter()
        
        return formatter.date(from: dateString)
    }) { (date) -> String? in
      guard let date = date else { return nil }
      
      let formatter = ReleaseDateFormatter.dateFormatter()
      
      return formatter.string(from: date)
    }
    
    releaseDate         <- (map["release_date"], dateTransform)
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











