//
//  SearchWorker.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 1/3/18.
//  Copyright © 2018 Francis Breidenbach. All rights reserved.
//

import Foundation

// Protocol

protocol SearchWorkerType {
  func search(query: String, completionHandler: @escaping SearchResultHandler)
}

// Class

class SearchWorker: SearchWorkerType {
  
  let searchService: SearchServiceType
  
  init(searchService: SearchServiceType) {
    self.searchService = searchService
  }
  
  func search(query: String, completionHandler: @escaping SearchResultHandler) {
    searchService.search(withQuery: query, completionHandler: completionHandler)
  }
  
}
