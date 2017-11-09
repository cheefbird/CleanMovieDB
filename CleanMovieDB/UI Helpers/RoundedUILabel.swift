//
//  RoundedUILabel.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/8/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit

@IBDesignable class RoundedUILabel: UILabel {
  
//  override func drawText(in rect: CGRect) {
//    var insets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
//    super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
//  }
  
  @IBInspectable var cornerValue: CGFloat = CGFloat(0.0) {
    didSet {
      layer.masksToBounds = true
      layer.cornerRadius = cornerValue
    }
  }
  
  @IBInspectable var borderColor: UIColor = UIColor.greenColor() {
    didSet {
      layer.borderColor = borderColor.cgColor
    }
  }
  
  @IBInspectable var borderWidth: CGFloat = CGFloat(0.0) {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  
}


