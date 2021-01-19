//
//  ListTodosInteractor.swift
//  TODO
//
//  Created by Chang gyun Park on 2021/01/19.
//  Copyright © 2021 nobleidea. All rights reserved.
//

import Foundation

protocol ListTodosBusinessLogic {
	func fetchTodos(request: ListTodos.FetchTodos.Request)
}

protocol ListTodosDataStore {
	var todos: [Todo]? { get }
}

class ListTodosInteractor: ListTodosBusinessLogic, ListTodosDataStore {
	var presenter: ListTodosPresentationLogic?

	var todosWorker = TodosWorker(todosStore: TodosMemStore())
	var todos: [Todo]?

	// MARK: - Fetch todos

	func fetchTodos(request: ListTodos.FetchTodos.Request) {
		todosWorker.fetchTodos { (todos) -> Void in
			self.todos = todos
			let response = ListTodos.FetchTodos.Response(todos: todos)
			self.presenter?.presentFetchedTodos(response: response)
		}
	}
}
