//
//  TodosWorker.swift
//  TODO
//
//  Created by Chang gyun Park on 2021/01/19.
//  Copyright © 2021 nobleidea. All rights reserved.
//

import Foundation

class TodosWorker {
	var todosStore: TodosStoreProtocol

	init(todosStore: TodosStoreProtocol) {
		self.todosStore = todosStore
	}

	func fetchTodos(completionHandler: @escaping ([Todo]) -> Void) {
		todosStore.fetchTodos { (todos, error) in
			do {
				DispatchQueue.main.async {
					completionHandler(todos)
				}
			}
		}
	}

}

protocol TodosStoreProtocol {
	func fetchTodos(completionHandler: @escaping ([Todo], TodosStoreError?) -> Void)
	func fetchTodo(id: String, completionHandler: @escaping (Todo?, TodosStoreError?) -> Void)
	func createTodo(todoToCreate: Todo, completionHandler: @escaping (Todo?, TodosStoreError?) -> Void)
	func updateTodo(todoToUpdate: Todo, completionHandler: @escaping (Todo?, TodosStoreError?) -> Void)
	func deleteTodo(id: String, completionHandler: @escaping (Todo?, TodosStoreError?) -> Void)
}

protocol TodosStoreUtilityProtocol {
}

extension TodosStoreUtilityProtocol {
	func generateTodo(todo: inout Todo) {
		guard todo.id == nil else { return }
		todo.id = "\(arc4random())"
	}
}


enum TodosStoreError: Equatable, Error
{
	case CannotFetch(String)
	case CannotCreate(String)
	case CannotUpdate(String)
	case CannotDelete(String)
}


func ==(lhs: TodosStoreError, rhs: TodosStoreError) -> Bool {
	switch (lhs, rhs) {
	case (.CannotFetch(let a), .CannotFetch(let b)) where a == b: return true
	case (.CannotCreate(let a), .CannotCreate(let b)) where a == b: return true
	case (.CannotUpdate(let a), .CannotUpdate(let b)) where a == b: return true
	case (.CannotDelete(let a), .CannotDelete(let b)) where a == b: return true
	default: return false
	}
}
