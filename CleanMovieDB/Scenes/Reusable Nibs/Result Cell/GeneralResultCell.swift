//
//  GeneralResultCell.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 1/11/18.
//  Copyright © 2018 Francis Breidenbach. All rights reserved.
//

import UIKit

@IBDesignable
class GeneralResultCell: UITableViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak var backdropImageView: UIImageView!
  @IBOutlet weak var movieTitleLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var indexLabel: UILabel!
  @IBOutlet weak var favoriteButton: UIButton!
  
  // MARK: - View Lifecycle
  
  override func prepareForInterfaceBuilder() {
    self.awakeFromNib()
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    // Must ensure no subviews: https://stackoverflow.com/questions/43046924/swift-3-designable-table-view-cell
    if self.subviews.count == 0 {
      self.setupNib()
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    if self.subviews.count == 0 {
      self.setupNib()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    
  }
  
  func setupNib() {
    
  }
}
