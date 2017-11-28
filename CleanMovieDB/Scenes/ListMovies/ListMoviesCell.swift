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
  private var movie: ListMovies.FetchMovies.ViewModel.DisplayedMovie!
  
  private var delegate: MovieCellDelegate!
  
  // MARK: - Deinit
  
  override func prepareForReuse() {
    self.movie = nil
    self.movieID = 0
    self.delegate = nil
  }
  
  // MARK: - Configure
  
  func configure(withMovie movie: ListMovies.FetchMovies.ViewModel.DisplayedMovie, atRow row: Int, sender: ListMoviesViewController) {
    
    self.movie = movie
    let score = String(describing: movie.averageScore)
    
    movieID = movie.id
    
    backdropImageView.kf.setImage(with: movie.backdropImageURL)
    scoreLabel.text = score
    movieTitleLabel.text = movie.title
    
    favoriteButton.isSelected = movie.isFavorite
    
    indexLabel.text = String(row + 1)
    
    delegate = sender
    
  }
  
  // MARK: - Actions
  
  @IBAction func toggleFavorite() {
    
    MoviesWorker.shared.toggleFavorite(forMovieID: movieID) { [weak self] result in
      self?.movie.isFavorite = result
      self?.favoriteButton.isSelected = result
      
      guard let index = self?.indexFromLabel() else { return }

      self?.delegate.favoriteStatusChanged(to: result, forMovieAtIndex: index)
    }
    
  }
  
  // MARK: - Helpers
  
  fileprivate func indexFromLabel() -> Int? {
    guard let labelText = indexLabel.text else { return nil }
    guard let labelValue = Int(labelText) else { return nil }
    
    return labelValue - 1
  }
  
}

// MARK: - MovieCellDelegate

protocol MovieCellDelegate {
  func favoriteStatusChanged(to status: Bool, forMovieAtIndex index: Int)
}
