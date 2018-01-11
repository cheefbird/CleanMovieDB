//
//  ReleaseDateFormatter.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 1/9/18.
//  Copyright © 2018 Francis Breidenbach. All rights reserved.
//

import Foundation

class ReleaseDateFormatter {
  
  private init() {}
  
  class func dateFormatter() -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.defaultDate = Date()
    
    return formatter
  }
}


