//
//  SearchRouter.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 1/3/18.
//  Copyright © 2018 Francis Breidenbach. All rights reserved.
//

import Foundation
import Alamofire


enum SearchRouter: URLRequestConvertible {
  
  // MARK: - Routes
  
  case search(String)
  
  // MARK: - Request Properties
  
  var baseURL: URL {
    return URL(string: "https://api.themoviedb.org/3/")!
  }

  var method: HTTPMethod {
    return .get
  }
  
  var path: String {
    switch self {
    case .search:
      return "search/movie"
    }
  }
  
  var parameters: Parameters {

    var params = Parameters()
    params["api_key"] = "7e6576c1d12633c8fd1eee0cb2e995ed"
    params["include_adult"] = "false"
    params["language"] = "en-US"

    switch self {
    case .search(let query):
      params["query"] = "\(query)"
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
