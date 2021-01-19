//
//  ShowTodoModels.swift
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

enum ShowTodo
{
	// MARK: Use cases

	enum GetTodo
	{
		struct Request
		{
		}
		struct Response
		{
			var todo: Todo
		}
		struct ViewModel
		{
			struct DisplayTodo {
				var id: String
				var title: String
				var content: String
			}

			var displayedTodo: DisplayTodo

		}
	}
}