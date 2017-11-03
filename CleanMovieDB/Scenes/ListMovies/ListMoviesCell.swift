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
  
  // MARK: - Configure
  
  func configure(with movie: ListMovies.FetchMovies.ViewModel.DisplayedMovie) {
    
    backdropImageView.kf.setImage(with: movie.backdropImageURL)
    
    movieTitleLabel.text = movie.title
    
  }
  
}
