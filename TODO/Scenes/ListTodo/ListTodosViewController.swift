//
//  ListTodoViewController.swift
//  TODO
//
//  Created by Chang gyun Park on 2021/01/19.
//  Copyright © 2021 nobleidea. All rights reserved.
//

import UIKit

protocol ListTodosDisplayLogic: class {
	func displayFetchedTodos(viewModel: ListTodos.FetchTodos.ViewModel)
}

class ListTodosViewController: UIViewController, ListTodosDisplayLogic {

	@IBOutlet weak var tableView: UITableView!

	// MARK: - public variable

	var displayedTodos = [ListTodos.FetchTodos.ViewModel.DisplayedTodo]()

	var interactor: ListTodosBusinessLogic?
	var router: (NSObjectProtocol & ListTodosRoutingLogic & ListTodosDataPassing)?

	// MARK: - life cycle

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

		setup()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)

		setup()
	}


	private func setup() {
		let viewController = self
		let interactor = ListTodosInteractor()
		let presenter = ListTodosPresenter()
		let router = ListTodosRouter()
		viewController.interactor = interactor
		viewController.router = router
		interactor.presenter = presenter
		presenter.viewController = viewController
		router.viewController = viewController
		router.dataStore = interactor
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		fetchTodos()
	}

	override func viewDidLoad() {
        super.viewDidLoad()
    }


	func fetchTodos() {
		let request = ListTodos.FetchTodos.Request()
		interactor?.fetchTodos(request: request)
	}

	func displayFetchedTodos(viewModel: ListTodos.FetchTodos.ViewModel) {
		displayedTodos = viewModel.displayedTodos
		tableView.reloadData()
	}
}

extension ListTodosViewController: UITableViewDelegate, UITableViewDataSource {

	// MARK: - tableView delegate, dataSource

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return displayedTodos.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let displayedTodo = displayedTodos[indexPath.row]
		var cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell")
		if cell == nil {
			cell = UITableViewCell(style: .value1, reuseIdentifier: "TodoTableViewCell")
		}

		cell?.textLabel?.text = displayedTodo.title

		return cell!
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		router?.routeToShowTodo()
	}


}
