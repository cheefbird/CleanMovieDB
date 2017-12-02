//
//  CustomView.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/27/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
//import QuartzCore

@IBDesignable class CustomView: UIView {
  
  // MARK: - Inspectables
  
  @IBInspectable var cornerRadius: CGFloat = 0.0 {
    didSet {
      self.layer.cornerRadius = cornerRadius
    }
  }
  
  @IBInspectable var borderColor: UIColor = UIColor.red {
    didSet {
      self.layer.borderColor = borderColor.cgColor
    }
  }
  
  @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
      self.layer.borderWidth = borderWidth
    }
  }
  
  // MARK: Drop Shadow
  
  @IBInspectable var shadowWidth: CGFloat = 0 {
    didSet {
      self.layer.shadowOffset.width = shadowWidth
    }
  }
  
  @IBInspectable var shadowHeight: CGFloat = 0 {
    didSet {
      self.layer.shadowOffset.height = shadowHeight
    }
  }
  
  @IBInspectable var shadowRadius: CGFloat = 0 {
    didSet {
      self.layer.shadowRadius = shadowRadius
    }
  }
  
  @IBInspectable var shadowOpacity: Float = 0 {
    didSet {
      self.layer.shadowOpacity = shadowOpacity
    }
  }
  
  @IBInspectable var shadowColor: UIColor = UIColor.gray {
    didSet {
      self.layer.shadowColor = shadowColor.cgColor
    }
  }
  
}
