//
//  WatchListCellTableViewCell.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/27/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
import Kingfisher

class WatchListCell: UITableViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet var cardView: UIView!
  @IBOutlet var posterImageView: UIImageView!
  @IBOutlet var movieTitleLabel: UILabel!
  @IBOutlet var movieScoreLabel: UILabel!
  
  // MARK: - Configure
  
  func configure(using movie: Movie) {
    let posterImagePath = movie.getImageURL(forType: .poster)
    
    posterImageView.kf.setImage(with: posterImagePath)
    movieTitleLabel.text = movie.title
    movieScoreLabel.text = String(movie.voteAverage)
  }

}
