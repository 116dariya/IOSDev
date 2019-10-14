//
//  Todos.swift
//  Test
//
//  Created by Дария Мухатова on 10/10/2019.
//  Copyright © 2019 Дария Мухатова. All rights reserved.
//


import Foundation
class Todo: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool?
    
    
    init(userId: Int, id: Int, title: String, completed : Bool) {
        self.userId = userId
        self.id = id
        self.title = title
        self.completed = completed
    }
}
