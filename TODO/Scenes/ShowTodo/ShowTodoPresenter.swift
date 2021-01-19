//
//  ShowTodoPresenter.swift
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

protocol ShowTodoPresentationLogic
{
	func presentTodo(response: ShowTodo.GetTodo.Response)
}

class ShowTodoPresenter: ShowTodoPresentationLogic
{
  weak var viewController: ShowTodoDisplayLogic?
  
  // MARK: Do something
  
	func presentTodo(response: ShowTodo.GetTodo.Response)
  {

	let todo = response.todo

	let displayedTodo = ShowTodo.GetTodo.ViewModel.DisplayTodo(id: todo.id!, title: todo.title, content: todo.content)
	let viewModel = ShowTodo.GetTodo.ViewModel(displayedTodo: displayedTodo)
    viewController?.displaySomething(viewModel: viewModel)
  }
}
