//
//  CustomTabBarItem.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 10/31/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit


@IBDesignable class CustomTabBar: UITabBar {
  
  @IBInspectable var unselectedColor: UIColor = UIColor.darkBlue() {
    didSet {
      unselectedItemTintColor = unselectedColor
    }
  }
  
}
