//
//  GeneralResultCell.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 1/11/18.
//  Copyright © 2018 Francis Breidenbach. All rights reserved.
//

import UIKit
import Kingfisher

enum ResultType {
  case search
  case discover
}

class GeneralResultCell: UITableViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak var backdropImageView: UIImageView!
  @IBOutlet weak var movieTitleLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var indexLabel: UILabel!
  @IBOutlet weak var favoriteButton: UIButton!
  
  // MARK: - Configure Cell
  
  func configure(forMedia media: Movie, atRow row: Int, forType type: ResultType) {
    let imagePath = media.getImageURL(forType: .backdrop)
    backdropImageView.kf.setImage(with: imagePath)
    
    let score = Int(media.voteAverage)
    scoreLabel.text = "\(score)"
    
    movieTitleLabel.text = media.title
    indexLabel.text = String(row + 1)
    
    switch type {
    case .discover:
      favoriteButton.isHidden = false
    case .search:
      favoriteButton.isHidden = true
    }
    
  }
}

// MARK: - GeneralResultCellDelegate

protocol GeneralResultCellDelegate {
  /// Notify the parent tableView's `movies` array when an element's `isFavorite` property changes.
  ///
  /// - Parameters:
  ///   - status: `Bool` to set for target movie's isFavorite property.
  ///   - index: Index of the movie in the `movies` array.
  func resultFavoriteChanged(toStatus status: Bool, forMovieAtIndex index: Int)
}
