//
//  ListTodosPresenter.swift
//  TODO
//
//  Created by Chang gyun Park on 2021/01/19.
//  Copyright © 2021 nobleidea. All rights reserved.
//

import Foundation

protocol ListTodosPresentationLogic {
	func presentFetchedTodos(response: ListTodos.FetchTodos.Response)
}

class ListTodosPresenter: ListTodosPresentationLogic {
	weak var viewController: ListTodosDisplayLogic?

	func presentFetchedTodos(response: ListTodos.FetchTodos.Response) {
		var displayedTodos: [ListTodos.FetchTodos.ViewModel.DisplayedTodo] = []

		for todo in response.todos {
			let displayedTodo = ListTodos.FetchTodos.ViewModel.DisplayedTodo(title: todo.title, content: todo.content)
			displayedTodos.append(displayedTodo)
		}

		let viewModel = ListTodos.FetchTodos.ViewModel(displayedTodos: displayedTodos)
		viewController?.displayFetchedTodos(viewModel: viewModel)
	}
}
