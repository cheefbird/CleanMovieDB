//
//  APISearchService.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 1/3/18.
//  Copyright © 2018 Francis Breidenbach. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class APISearchService: SearchServiceType {
  func search(withQuery query: String, completionHandler: @escaping SearchResultHandler) {
    
    Alamofire.request(SearchRouter.search(query))
      .responseArray(keyPath: "results") { (response: DataResponse<[TMDbMovie]>) in
        guard response.result.error == nil else {
          print("SEARCH ERROR: unable to search for \(query)")
          print("\(response.result.error?.localizedDescription)")
          completionHandler([], SearchRouterError.networkError)
          return
        }
        
        guard let results = response.result.value else {
          print("SEARCH ERROR: response value problem")
          completionHandler([], SearchRouterError.serializationError)
          return
        }
        
        completionHandler(results, nil)
    }
    
  }
}
