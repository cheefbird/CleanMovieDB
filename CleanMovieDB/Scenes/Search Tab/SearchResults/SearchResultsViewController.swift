//
//  SearchResultsViewController.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 1/9/18.
//  Copyright (c) 2018 Francis Breidenbach. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SearchResultsDisplayLogic: class {
  func displaySomething(viewModel: SearchResults.Something.ViewModel)
}

class SearchResultsViewController: UITableViewController, SearchResultsDisplayLogic {
  var interactor: (SearchResultsBusinessLogic & SearchResultsDataStore)?
  var router: (NSObjectProtocol & SearchResultsRoutingLogic & SearchResultsDataPassing)?
  
  // MARK: - Properties
  
  var results: [Movie]?

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
    let interactor = SearchResultsInteractor()
    let presenter = SearchResultsPresenter()
    let router = SearchResultsRouter()
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
    
//    guard case let self.results = interactor?.movies else { return }
//
//    if let resultsCount = interactor?.movies?.count,
//      resultsCount > 0 {
//      navigationItem.title = "\(resultsCount) Results"
//    }
//    navigationItem.title = "No Search Results"
  }
  
  // MARK: - Table View DataSource
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let numberOfMovies = interactor?.movies?.count else { return 0 }
    
    return numberOfMovies
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath)
    
    return cell
//    guard let movie = results?[indexPath.row] else { return cell }
//
//    cell.textLabel?.text = movie.title
//    cell.detailTextLabel?.text = movie.
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething() {
    let request = SearchResults.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: SearchResults.Something.ViewModel) {
    
  }
}
