//
//  RoundedUILabel.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/8/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit

@IBDesignable class RoundedUILabel: UILabel {

  var textInsets = UIEdgeInsets.zero {
    didSet { invalidateIntrinsicContentSize() }
  }
  
  override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
    let insetRect = UIEdgeInsetsInsetRect(bounds, textInsets)
    let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
    let invertedInsets = UIEdgeInsets(top: -textInsets.top,
                                      left: -textInsets.left,
                                      bottom: -textInsets.bottom,
                                      right: -textInsets.right)
    return UIEdgeInsetsInsetRect(textRect, invertedInsets)
  }
  
  override func drawText(in rect: CGRect) {
    super.drawText(in: UIEdgeInsetsInsetRect(rect, textInsets))
  }
  
  // MARK: - Stored Inspectables
  
  @IBInspectable var cornerValue: Float = 0.0 {
    didSet {
      layer.masksToBounds = true
      layer.cornerRadius = CGFloat(cornerValue)
    }
  }
  
  @IBInspectable var borderColor: UIColor = UIColor.greenColor() {
    didSet {
      layer.borderColor = borderColor.cgColor
    }
  }
  
  @IBInspectable var borderWidth: Float = 0.0 {
    didSet {
      layer.borderWidth = CGFloat(borderWidth)
    }
  }
  
}

extension RoundedUILabel {
  
  @IBInspectable var leftTextInset: CGFloat {
    set { textInsets.left = newValue }
    get { return textInsets.left }
  }
  
  @IBInspectable var rightTextInset: CGFloat {
    set { textInsets.right = newValue }
    get { return textInsets.right }
  }
  
  @IBInspectable var topTextInset: CGFloat {
    set { textInsets.top = newValue }
    get { return textInsets.top }
  }
  
  @IBInspectable var bottomTextInset: CGFloat {
    set { textInsets.bottom = newValue }
    get { return textInsets.bottom }
  }
}


