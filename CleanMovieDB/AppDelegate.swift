//
//  AppDelegate.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 10/30/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    UIApplication.shared.statusBarStyle = .lightContent
    
    return true
  }
}

