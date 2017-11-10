//
//  ListMoviesCell.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/3/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
import Kingfisher

class ListMoviesCell: UITableViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak var backdropImageView: UIImageView!
  @IBOutlet weak var movieTitleLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var indexLabel: UILabel!
  
  // MARK: - Configure
  
  func configure(with movie: ListMovies.FetchMovies.ViewModel.DisplayedMovie, atRow row: Int) {
    
    let score = String(describing: movie.averageScore)
    
    backdropImageView.kf.setImage(with: movie.backdropImageURL)
    scoreLabel.text = score
    movieTitleLabel.text = movie.title
    
    indexLabel.text = String(row + 1)
    
  }
  
}
