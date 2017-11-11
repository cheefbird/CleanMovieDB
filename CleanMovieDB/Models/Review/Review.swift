//
//  Review.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/10/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import ObjectMapper

class Review: ReviewObject, Mappable {
    
    // MARK: - Properties
    
    var id = ""
    var author = ""
    var content = ""
    
    // MARK: - Init
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    
    func mapping(map: Map) {
        id <- map["id"]
        author <- map["author"]
        content <- map["content"]
    }
    
    
}
