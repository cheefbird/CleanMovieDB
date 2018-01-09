//
//  SearchServiceType.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 1/3/18.
//  Copyright © 2018 Francis Breidenbach. All rights reserved.
//

import Foundation

typealias SearchResultHandler = (_ results: [Movie], _ error: Error?) -> Void

protocol SearchServiceType {
  func search(withQuery query: String, completionHandler: @escaping SearchResultHandler)
}
