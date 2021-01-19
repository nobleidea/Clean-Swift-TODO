//
//  ListTodosModels.swift
//  TODO
//
//  Created by Chang gyun Park on 2021/01/19.
//  Copyright © 2021 nobleidea. All rights reserved.
//

import Foundation

enum ListTodos {
	enum FetchTodos {
		struct Request {

		}

		struct Response {
			var todos: [Todo]
		}

		struct ViewModel {
			struct DisplayedTodo {
				var title: String
				var content: String
			}

			var displayedTodos: [DisplayedTodo]
		}
	}
}
