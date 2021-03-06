//
//  ShowTodoViewController.swift
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

protocol ShowTodoDisplayLogic: class
{
	func displaySomething(viewModel: ShowTodo.GetTodo.ViewModel)
}

class ShowTodoViewController: UIViewController, ShowTodoDisplayLogic
{
	@IBOutlet weak var contentLabel: UILabel!
	@IBOutlet weak var titleLabel: UILabel!
	var interactor: ShowTodoBusinessLogic?
	var router: (NSObjectProtocol & ShowTodoRoutingLogic & ShowTodoDataPassing)?

	// MARK: Object lifecycle

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
	{
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		setup()
	}

	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		setup()
	}

	// MARK: Setup

	private func setup()
	{
		let viewController = self
		let interactor = ShowTodoInteractor()
		let presenter = ShowTodoPresenter()
		let router = ShowTodoRouter()
		viewController.interactor = interactor
		viewController.router = router
		interactor.presenter = presenter
		presenter.viewController = viewController
		router.viewController = viewController
		router.dataStore = interactor
	}

	// MARK: Routing

	override func prepare(for segue: UIStoryboardSegue, sender: Any?)
	{
		if let scene = segue.identifier {
			let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
			if let router = router, router.responds(to: selector) {
				router.perform(selector, with: segue)
			}
		}
	}

	// MARK: View lifecycle

	override func viewDidLoad()
	{
		super.viewDidLoad()
		doSomething()
	}

	// MARK: Do something

	//@IBOutlet weak var nameTextField: UITextField!

	func doSomething()
	{
		let request = ShowTodo.GetTodo.Request()
		interactor?.getTodo(request: request)
	}

	func displaySomething(viewModel: ShowTodo.GetTodo.ViewModel)
	{
		let displayedTodo = viewModel.displayedTodo
		titleLabel.text = displayedTodo.title
		contentLabel.text = displayedTodo.content
	}
}
