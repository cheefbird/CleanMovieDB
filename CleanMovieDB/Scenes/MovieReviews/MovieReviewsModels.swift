//
//  MovieReviewsModels.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/11/17.
//  Copyright (c) 2017 Francis Breidenbach. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum MovieReviews {
  // MARK: Use cases
  
  enum GetReviews {
    struct Request {
    }
    struct Response {
      var reviews: [ReviewObject]
    }
    struct ViewModel {
      
      struct DisplayedReview {
        var id: String
        var author: String
        var content: String
      }
      
      var displayedReviews: [DisplayedReview]
      
    }
  }
}
