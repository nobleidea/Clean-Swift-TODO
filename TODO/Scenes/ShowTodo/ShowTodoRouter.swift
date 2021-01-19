//
//  ShowTodoRouter.swift
//  TODO
//
//  Created by Chang gyun Park on 2021/01/19.
//  Copyright (c) 2021 nobleidea. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol ShowTodoRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ShowTodoDataPassing
{
  var dataStore: ShowTodoDataStore? { get }
}

class ShowTodoRouter: NSObject, ShowTodoRoutingLogic, ShowTodoDataPassing
{
  weak var viewController: ShowTodoViewController?
  var dataStore: ShowTodoDataStore?
  
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
  
  //func navigateToSomewhere(source: ShowTodoViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: ShowTodoDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}