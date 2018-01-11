//
//  SearchAllModels.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 1/8/18.
//  Copyright (c) 2018 Francis Breidenbach. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum SearchAll {
  // MARK: Use cases
  
  enum Search {
    struct Request {
      var query: String
    }
    struct Response {
      var results: [Movie]
    }
    struct ViewModel {
      var movies: [Movie]
    }
  }
}
