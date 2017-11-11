//
//  RealmReview.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/10/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RealmSwift

class RealmReview: Object, ReviewObject {
  
  // MARK: - Persisted Properties
  
  @objc dynamic var id = ""
  @objc dynamic var author = ""
  @objc dynamic var content = ""
  
  // MARK: - Init
  
  convenience required init(copyFrom review: ReviewObject) {
    self.init()
    
    id = review.id
    author = review.author
    content = review.content
  }
  
  // MARK: - Overrides
  
  override static func primaryKey() -> String? {
    return "id"
  }
  
}
