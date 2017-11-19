//
//  MovieDetailsViewController.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 11/3/17.
//  Copyright (c) 2017 Francis Breidenbach. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Kingfisher

protocol MovieDetailsDisplayLogic: class {
  func displayMovie(viewModel: MovieDetails.ShowDetails.ViewModel)
}

class MovieDetailsViewController: UIViewController, MovieDetailsDisplayLogic {
  
  var interactor: MovieDetailsBusinessLogic?
  var router: (NSObjectProtocol & MovieDetailsRoutingLogic & MovieDetailsDataPassing)?
  
  // MARK: - Outlets
  
  @IBOutlet var backdropImageView: UIImageView!
  @IBOutlet var posterImageView: UIImageView!
  @IBOutlet var movieTitleLabel: UILabel!
  @IBOutlet var movieScoreLabel: UILabel!
  @IBOutlet var movieSummaryLabel: UILabel!
  @IBOutlet var reviewsButton: UIButton!

  // MARK: - Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: - Setup
  
  private func setup() {
    let viewController = self
    let interactor = MovieDetailsInteractor()
    let presenter = MovieDetailsPresenter()
    let router = MovieDetailsRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: - Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    print("SEGUE STARTED")
    print(router?.dataStore?.movie?.title)
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: - View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getMovieToDisplay()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func getMovieToDisplay() {
    let request = MovieDetails.ShowDetails.Request()
    interactor?.prepareMovie(request: request)
  }
  
  func displayMovie(viewModel: MovieDetails.ShowDetails.ViewModel) {
    let movie = viewModel.displayedMovie
    
    self.navigationItem.title = movie.title
    
    backdropImageView.kf.setImage(with: movie.backdropImage)
    posterImageView.kf.setImage(with: movie.posterImage)
    
    movieTitleLabel.text = movie.title
    movieScoreLabel.text = "Score: \(movie.averageScore)"
    movieSummaryLabel.text = movie.summary
  }
}











