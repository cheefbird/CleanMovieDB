//
//  RealmUser.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/20/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RealmSwift

class RealmUser: Object, User {
  
  // MARK: - Properties
  
  var name: String = ""
  var favoriteMovies: [MovieObject] {
    return Array(_favoriteMovies)
  }
  
  // MARK: - Private Properties
  
  let _favoriteMovies = List<RealmMovie>()
  
  // MARK: - Init
  
  convenience init(name: String) {
    self.init()
    
    self.name = name
  }
  
}
