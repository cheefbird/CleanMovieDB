//
//  ListMoviesInteractor.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 10/30/17.
//  Copyright (c) 2017 Francis Breidenbach. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListMoviesBusinessLogic {
  func fetchMovies(request: ListMovies.FetchMovies.Request)
}

protocol ListMoviesDataStore {
  var movies: [MovieObject]? { get }
}

class ListMoviesInteractor: ListMoviesBusinessLogic, ListMoviesDataStore {
  
  var presenter: ListMoviesPresentationLogic?
  var worker: MoviesWorker?
  
  var movies: [MovieObject]?
  
  // MARK: Do something
  
  func fetchMovies(request: ListMovies.FetchMovies.Request) {
    
    worker?.fetchMovies(forPage: request.page) { (movies, error) in
      guard error == nil else {
        print("ERROR: ERROR occurred while fetching movies")
        return
      }
      
      if self.movies == nil {
        self.movies = movies
      } else {
        self.movies?.append(contentsOf: movies)
      }
      
      let response = ListMovies.FetchMovies.Response(movies: movies)
      self.presenter?.presentMovies(response: response)
    }
  }
}
