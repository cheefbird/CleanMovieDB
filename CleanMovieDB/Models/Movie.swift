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
  var posterImagePath: String?
  var backdropImagePath: String?
  
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

// MARK: - Image Type

extension Movie {
  
  enum ImageType {
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
}

// MARK: - Equatable

extension Movie: Equatable {
  
  static func ==(lhs: Movie, rhs: Movie) -> Bool {
    return lhs.id == rhs.id
      && lhs.popularity == rhs.popularity
      && lhs.voteAverage == rhs.voteAverage
  }
}

// MARK: - Image URL

extension Movie {
  
  func getImageURL(forType type: ImageType) -> URL {
    
    let baseURL = "https://image.tmdb.org/t/p/"
    var path = ""
    
    switch type {
    case .poster:
      path = "\(type.dimensions)/\(String(describing: self.posterImagePath))"
      
    case .backdrop:
      path = "\(type.dimensions)/\(String(describing: self.backdropImagePath))"
    }
    
    let result = baseURL + path
    
    return URL(string: result)!
  }
}









