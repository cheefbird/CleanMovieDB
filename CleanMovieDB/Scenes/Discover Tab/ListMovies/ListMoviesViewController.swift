//
//  ListMoviesViewController.swift
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

protocol ListMoviesDisplayLogic: class {
  func displayMovies(viewModel: ListMovies.FetchMovies.ViewModel)
}

class ListMoviesViewController: UIViewController, ListMoviesDisplayLogic {
  
  // MARK: Critical Properties
  
  var interactor: ListMoviesBusinessLogic?
  var router: (NSObjectProtocol & ListMoviesRoutingLogic & ListMoviesDataPassing)?
  
  // MARK: - Properties
  
  var movies = [ListMovies.FetchMovies.ViewModel.DisplayedMovie]()
  
  var pagesLoaded = 0
  var isFetching = false
  
  // MARK: Outlets
  
  @IBOutlet var tableView: UITableView!
  @IBOutlet var navBarItems: UINavigationItem!
  
  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let interactor = ListMoviesInteractor()
    let presenter = ListMoviesPresenter()
    let router = ListMoviesRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadMoviesFromRealm()
  }

  // MARK: Fetch Movies
  
  func loadMoviesFromRealm() {
    let request = ListMovies.FetchMovies.Request(page: 0)
    isFetching = true
    interactor?.fetchMovies(request: request)
  }
  
  func fetchMovies(forPage page: Int) {
    let request = ListMovies.FetchMovies.Request(page: page)
    isFetching = true
    interactor?.fetchMovies(request: request)
  }
  
  func displayMovies(viewModel: ListMovies.FetchMovies.ViewModel) {
    isFetching = false
    movies.append(contentsOf: viewModel.displayedMovies)
    
    guard movies.count > 0 else {
      pagesLoaded = 1
      fetchMovies(forPage: pagesLoaded)
      return
    }
    
    pagesLoaded = movies.count / 20 + 1
    
    navBarItems.title = "Discover Movies - \(pagesLoaded - 1) Pages"
    
    tableView.reloadData()
  }
}

// MARK: - TableView Delegate

extension ListMoviesViewController: UITableViewDelegate {
  
}

// MARK: - TableView DataSource

extension ListMoviesViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count
  }
  
  fileprivate func loadMoreIfNeeded(_ indexPath: IndexPath) {
    
    if (movies.count - indexPath.row < 3) && !isFetching {
      fetchMovies(forPage: pagesLoaded)
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    loadMoreIfNeeded(indexPath)
    
    let movie = movies[indexPath.row]
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! ListMoviesCell
    
    cell.configure(withMovie: movie, atRow: indexPath.row, sender: self)
    
    return cell
  }
  
}

// MARK: - MovieCellDelegate

extension ListMoviesViewController: MovieCellDelegate {
  
  func movieIsFavoriteChanged(toStatus status: Bool, forMovieAtIndex index: Int) {
    movies[index].isFavorite = status
  }
  
}










