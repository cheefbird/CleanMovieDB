//
//  CustomButton.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/20/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
  
  @IBInspectable var cornerRadius: CGFloat = 0.0 {
    didSet {
      self.layer.cornerRadius = cornerRadius
    }
  }
  
  @IBInspectable var borderWidth: CGFloat = 0.0 {
    didSet {
      self.layer.borderWidth = borderWidth
    }
  }
  
  @IBInspectable var borderColor: UIColor = UIColor.red {
    didSet {
      self.layer.borderColor = borderColor.cgColor
    }
  }
}

