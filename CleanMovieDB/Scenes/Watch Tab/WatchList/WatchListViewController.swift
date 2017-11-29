//
//  WatchListViewController.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/27/17.
//  Copyright (c) 2017 Francis Breidenbach. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol WatchListDisplayLogic: class {
  func displayMovies(viewModel: WatchList.LoadMovies.ViewModel)
}

class WatchListViewController: UIViewController, WatchListDisplayLogic {
  
  // MARK: - Dependencies
  
  var interactor: WatchListBusinessLogic?
  var router: (NSObjectProtocol & WatchListRoutingLogic & WatchListDataPassing)?
  
  // MARK: - Properties
  
  var movies = [MovieObject]()
  
  // MARK: - Outlets
  
  @IBOutlet var tableView: UITableView!
  
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
    let interactor = WatchListInteractor()
    let presenter = WatchListPresenter()
    let router = WatchListRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
    
    navigationItem.title = "My Watch List"
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
    
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 220
    
    loadMoviesFromRealm()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func loadMoviesFromRealm() {
    let request = WatchList.LoadMovies.Request()
    interactor?.loadMovies(request: request)
  }
  
  func displayMovies(viewModel: WatchList.LoadMovies.ViewModel) {
    movies = viewModel.movies
    
    navigationItem.title = "My Watch List (\(movies.count) Movies)"
    
    tableView.reloadData()
  }
}

// MARK: - TableView Delegate

extension WatchListViewController: UITableViewDelegate {
  
}

// MARK: - TableView DataSource

extension WatchListViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "WatchListCell", for: indexPath) as! WatchListCell
    
    let movie = movies[indexPath.row]
    cell.configure(using: movie)
    
//    cell.contentView.layoutIfNeeded()
    
    return cell
  }
}












