//
//  ListMoviesCell.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/3/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit

class ListMoviesCell: UITableViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak var backdropImageView: UIImageView!
  @IBOutlet weak var movieTitleLabel: UILabel!
  
  // MARK: - Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
