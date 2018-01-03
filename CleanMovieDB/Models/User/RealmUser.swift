//
//  RealmUser.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/20/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RealmSwift

class RealmUser: Object, User {
  
  // MARK: - Properties
  
  @objc dynamic var name: String = ""
  var favoriteMovies: [Movie] {
    return Array(_favoriteMovies)
  }
  
  // MARK: - Private Properties
  
  let _favoriteMovies = List<RealmMovie>()
  
  // MARK: - Init
  
  convenience init(name: String) {
    self.init()
    
    self.name = name
  }
  
  // MARK: - Overrides
  
  override static func primaryKey() -> String? {
    return "name"
  }
  
  // MARK: - Methods
  
  private static func createDefaultUser(inRealm realm: Realm) -> RealmUser {
    
    let user = RealmUser(name: "default")
    
    try! realm.write {
      realm.add(user)
    }
    
    return user
  }
  
  static func defaultUser(inRealm realm: Realm) -> RealmUser {
    return realm.object(ofType: RealmUser.self, forPrimaryKey: "default") ?? createDefaultUser(inRealm: realm)
  }
  
}
