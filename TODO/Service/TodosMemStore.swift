//
//  TodosMemStore.swift
//  TODO
//
//  Created by Chang gyun Park on 2021/01/19.
//  Copyright © 2021 nobleidea. All rights reserved.
//

import Foundation

class TodosMemStore: TodosStoreProtocol, TodosStoreUtilityProtocol {

	// MARK: - Data

	static var todos = [
		Todo(id: "123", title: "테스트1", content: "성공하자!"),
		Todo(id: "345", title: "테스트2", content: "성공할수밖에없지!")
	]
	func fetchTodos(completionHandler: @escaping ([Todo], TodosStoreError?) -> Void) {
		completionHandler(type(of: self).todos, nil)
	}
	
	func fetchTodo(id: String, completionHandler: @escaping (Todo?, TodosStoreError?) -> Void) {
		if let index = indexOfTodoWithID(id: id) {
			let todo = type(of: self).todos[index]
			completionHandler(todo, nil)
		} else {
			completionHandler(nil, TodosStoreError.CannotFetch("Cannot fetch todo with id \(id)"))
		}
	}
	
	func createTodo(todoToCreate: Todo, completionHandler: @escaping (Todo?, TodosStoreError?) -> Void) {
		var todo = todoToCreate
		generateTodo(todo: &todo)
		type(of: self).todos.append(todo)
		completionHandler(todo, nil)
	}
	
	func updateTodo(todoToUpdate: Todo, completionHandler: @escaping (Todo?, TodosStoreError?) -> Void) {
		if let index = indexOfTodoWithID(id: todoToUpdate.id) {
		  type(of: self).todos[index] = todoToUpdate
		  let todo = type(of: self).todos[index]
		  completionHandler(todo, nil)
		} else {
		  completionHandler(nil, TodosStoreError.CannotUpdate("Cannot fetch order with id \(String(describing: todoToUpdate.id)) to update"))
		}
	}

	
	func deleteTodo(id: String, completionHandler: @escaping (Todo?, TodosStoreError?) -> Void) {
		if let index = indexOfTodoWithID(id: id) {
			let todo = type(of: self).todos.remove(at: index)
			completionHandler(todo, nil)
			return
		}

		completionHandler(nil, TodosStoreError.CannotDelete("Cannot delete todo with id \(id)"))
	}

	private func indexOfTodoWithID(id: String?) -> Int?
	{
	  return type(of: self).todos.firstIndex { return $0.id == id }
	}
	
}
