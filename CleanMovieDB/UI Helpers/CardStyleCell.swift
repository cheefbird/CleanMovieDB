//
//  CardStyleCell.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/27/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit

@IBDesignable class CardStyleCell: UIView {
  
  @IBInspectable var cornerRadius: CGFloat = 0.0 {
    didSet {
      self.layer.cornerRadius = cornerRadius
    }
  }
  
}
