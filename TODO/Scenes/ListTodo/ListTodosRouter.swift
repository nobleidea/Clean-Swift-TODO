//
//  ListTodosRouter.swift
//  TODO
//
//  Created by Chang gyun Park on 2021/01/19.
//  Copyright © 2021 nobleidea. All rights reserved.
//

import UIKit

@objc protocol ListTodosRoutingLogic {
	func routeToCreateTodo()
	func routeToShowTodo()
}

protocol ListTodosDataPassing {
	var dataStore: ListTodosDataStore? { get }
}

class ListTodosRouter: NSObject, ListTodosRoutingLogic, ListTodosDataPassing {
	weak var viewController: ListTodosViewController?
	var dataStore: ListTodosDataStore?

	// MARK: - Routing

	func routeToCreateTodo() {
		let destinationVC = CreateTodoViewController()
		var destinationDS = destinationVC.router!.dataStore!
		passDataToCreateTodo(source: dataStore!, destination: &destinationDS)
		navigateToCreateTodo(source: viewController!, destination: destinationVC)
	}

	func routeToShowTodo() {
		let destinationVC = ShowTodoViewController()
		var destinationDS = destinationVC.router!.dataStore!
		passDataToShowTodo(source: dataStore!, destination: &destinationDS)
		navigateToShowTodo(source: viewController!, destination: destinationVC)
	}

	// MARK: - navigation

	func navigateToCreateTodo(source: ListTodosViewController, destination: CreateTodoViewController) {
		source.show(destination, sender: nil)
	}

	func navigateToShowTodo(source: ListTodosViewController, destination: ShowTodoViewController) {
		source.show(destination, sender: nil)
	}

	// MARK: - parsing data

	func passDataToCreateTodo(source: ListTodosDataStore, destination: inout CreateTodoDataStore) {

	}

	func passDataToShowTodo(source: ListTodosDataStore, destination: inout ShowTodoDataStore) {
		let selectedRow = viewController?.tableView.indexPathForSelectedRow?.row
		destination.todo = source.todos?[selectedRow!]
	}

}
