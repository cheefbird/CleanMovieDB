//
//  RealmMovie.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/7/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RealmSwift

class RealmMovie: Object, MovieObject {
  
  @objc dynamic var id = 0
  @objc dynamic var title = ""
  @objc dynamic var summary = ""
  @objc dynamic var popularity = 0.0
  @objc dynamic var voteAverage = 0.0
  @objc dynamic var posterImagePath = ""
  @objc dynamic var backdropImagePath = ""
  
  let reviews = List<RealmReview>()
  
  convenience required init(copy movie: MovieObject) {
    self.init()
    
    id = movie.id
    title = movie.title
    summary = movie.summary
    popularity = movie.popularity
    voteAverage = movie.voteAverage
    posterImagePath = movie.posterImagePath
    backdropImagePath = movie.backdropImagePath
  }
  
  // MARK: - Overrides
  
  override static func primaryKey() -> String? {
    return "id"
  }
  
}
