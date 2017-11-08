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
  var movies: [Movie]? { get }
}

class ListMoviesInteractor: ListMoviesBusinessLogic, ListMoviesDataStore {
  
  var presenter: ListMoviesPresentationLogic?
  var worker: MoviesWorker?
  
  var movies: [Movie]?
  
  // MARK: Do something
  
  func fetchMovies(request: ListMovies.FetchMovies.Request) {
    
//    worker?.fetchMovies(forPage: request.page) { result in
//      guard let newMovies = result.value else { return }
//      
//      if self.movies == nil {
//        self.movies = newMovies
//      } else {
//        newMovies.forEach({ movie in
//          self.movies?.append(movie)
//        })
//      }
//      
//      let response = ListMovies.FetchMovies.Response(movies: newMovies)
//      self.presenter?.presentMovies(response: response)
//    }
  }
}
