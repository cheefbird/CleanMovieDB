//
//  MovieObject.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/7/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation

protocol MovieObject {
  
  // MARK: - Properties
  
  var id: Int { get }
  var title: String { get }
  var summary: String { get }
  var popularity: Double { get }
  var voteAverage: Double { get }
  var posterImagePath: String { get }
  var backdropImagePath: String { get }
  
  func getImageURL(forType type: MovieImageType) -> URL

}

// MARK: - Image URL

extension MovieObject {
  
  func getImageURL(forType type: MovieImageType) -> URL {
    
    let baseURL = "https://image.tmdb.org/t/p/"
    var path = ""
    
    switch type {
    case .poster:
      if posterImagePath.count > 4 {
        path = "\(type.dimensions)\(posterImagePath)"
      } else {
        return URL(string: "https://placeimg.com/500/780/any")!
      }
      
    case .backdrop:
      if backdropImagePath.count > 4 {
        path = "\(type.dimensions)\(backdropImagePath)"
      } else {
        return URL(string: "https://placeimg.com/780/439/any")!
      }
    }
    
    let result = baseURL + path
    
    return URL(string: result)!
  }
}
