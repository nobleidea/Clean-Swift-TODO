//
//  ShowTodoInteractor.swift
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

protocol ShowTodoBusinessLogic
{
	func getTodo(request: ShowTodo.GetTodo.Request)
}

protocol ShowTodoDataStore
{
	var todo: Todo! { get set }
}

class ShowTodoInteractor: ShowTodoBusinessLogic, ShowTodoDataStore
{
	var presenter: ShowTodoPresentationLogic?
	//  var worker: ShowTodoWorker?
	
	var todo: Todo!
	
	// MARK: Do something
	
	func getTodo(request: ShowTodo.GetTodo.Request)
	{
		let response = ShowTodo.GetTodo.Response(todo: todo)
		presenter?.presentTodo(response: response)
//		worker = ShowTodoWorker()
//		worker?.doSomeWork()
//
//		let response = ShowTodo.Something.Response()
//		presenter?.presentSomething(response: response)
	}
}
