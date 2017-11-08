//
//  APIMovieService.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/7/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class APIMovieService: MovieServiceType {
  
  func getMovies(forPage page: Int?, completionHandler: @escaping MovieServiceType.MoviesResult) {
    guard let page = page else { return }
    
    Alamofire.request(MoviesRouter.getMovies(page: page))
      .responseArray(keyPath: "results") { (response: DataResponse<[Movie]>) in
        
        guard response.result.error == nil else {
          completionHandler([], response.result.error!)
          print("ERROR: ERROR occurred when requesting page \(page) of movies")
          return
        }
        
        guard let movieArray = response.result.value else {
          completionHandler([], nil)
          print("ERROR: ERROR occurred when setting response value to property")
          return
        }
        
        completionHandler(movieArray, nil)
        
    }
  }
}
