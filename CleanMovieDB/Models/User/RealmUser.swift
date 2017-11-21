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
  
  var favoriteMovies: [MovieObject] {
    return Array(_favoriteMovies)
  }
  
  let _favoriteMovies = List<RealmMovie>()
  
}
