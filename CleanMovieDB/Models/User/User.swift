//
//  User.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/20/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation

protocol User {
  
  var name: String { get }
  var favoriteMovies: [MovieObject] { get }
  
}
