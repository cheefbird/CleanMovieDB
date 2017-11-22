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
  @IBOutlet weak var favoriteButton: UIButton!
  
  private var movieID: Int = 0
  
  // MARK: - Configure
  
  func configure(with movie: ListMovies.FetchMovies.ViewModel.DisplayedMovie, atRow row: Int) {
    
    let score = String(describing: movie.averageScore)
    
    movieID = movie.id
    
    backdropImageView.kf.setImage(with: movie.backdropImageURL)
    scoreLabel.text = score
    movieTitleLabel.text = movie.title
    
    favoriteButton.isSelected = movie.isFavorite
    
    indexLabel.text = String(row + 1)
    
  }
  
  // MARK: - Actions
  
  @IBAction func toggleFavorite() {
    
    MoviesWorker.shared.toggleFavorite(forMovieID: movieID) { result in
      favoriteButton.isSelected = result
    }
    
  }
  
}
