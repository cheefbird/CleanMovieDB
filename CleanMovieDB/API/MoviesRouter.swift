//
//  MoviesRouter.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 10/31/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import Alamofire


enum MoviesRouter: URLRequestConvertible {
  
  // MARK: - Routes
  
  case getMovies(page: Int)
  case getReview(id: Int)
  case searchMovies(query: String)
  
  // MARK: - Request Properties
  
  var baseURL: URL {
    return URL(string: "https://api.themoviedb.org/3/")!
  }
  
  var method: HTTPMethod {
    return .get
  }
  
  var path: String {
    switch self {
    case .getMovies:
      return "discover/movie"
    case .getReview(let id):
      return "movie/\(id)/reviews"
    case .searchMovies:
      return "search/movie"
    }
  }
  
  var parameters: Parameters {
    
    var params = Parameters()
    params["api_key"] = "7e6576c1d12633c8fd1eee0cb2e995ed"
    params["language"] = "en-US"
    
    switch self {
    case .getMovies(let page):
      params["page"] = page
      params["sort_by"] = "popularity.desc"
      params["include_adult"] = "false"
      params["include_video"] = "false"
    case .getReview:
      break
    case .searchMovies(let query):
      params["query"] = query
      params["include_adult"] = false
    }
    
    return params
    
  }
  
  // MARK: - asURLRequest
  
  func asURLRequest() throws -> URLRequest {
    let requestURL = baseURL.appendingPathComponent(path)
    
    var urlRequest = URLRequest(url: requestURL)
    urlRequest.httpMethod = method.rawValue
    
    let encoding = URLEncoding.default
    
    return try encoding.encode(urlRequest, with: parameters)
  }
}














