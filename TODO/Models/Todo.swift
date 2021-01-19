//
//  Todo.swift
//  TODO
//
//  Created by Chang gyun Park on 2021/01/19.
//  Copyright © 2021 nobleidea. All rights reserved.
//

import Foundation

struct Todo: Equatable {
	var id: String?
	var title: String
	var content: String
}

func ==(lhs: Todo, rhs: Todo) -> Bool {
	return lhs.title == rhs.title
		&& lhs.content == rhs.content
}
