//
//  SearchAllRouter.swift
//  CleanMovieDB
//
//  Created by Francis Breidenbach on 1/8/18.
//  Copyright (c) 2018 Francis Breidenbach. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol SearchAllRoutingLogic {
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol SearchAllDataPassing {
  var dataStore: SearchAllDataStore? { get }
}

class SearchAllRouter: NSObject, SearchAllRoutingLogic, SearchAllDataPassing {
  weak var viewController: SearchAllViewController?
  var dataStore: SearchAllDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: SearchAllViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: SearchAllDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
