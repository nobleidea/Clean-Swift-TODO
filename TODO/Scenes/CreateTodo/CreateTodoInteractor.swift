//
//  CreateTodoInteractor.swift
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

protocol CreateTodoBusinessLogic
{
  func doSomething(request: CreateTodo.Something.Request)
}

protocol CreateTodoDataStore
{
  //var name: String { get set }
}

class CreateTodoInteractor: CreateTodoBusinessLogic, CreateTodoDataStore
{
  var presenter: CreateTodoPresentationLogic?
  var worker: CreateTodoWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: CreateTodo.Something.Request)
  {
    worker = CreateTodoWorker()
    worker?.doSomeWork()
    
    let response = CreateTodo.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
