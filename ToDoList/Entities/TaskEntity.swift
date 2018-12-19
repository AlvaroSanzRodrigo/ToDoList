//
//  TaskEntity.swift
//  ToDoList
//
//  Created by Álvaro Sanz Rodrigo on 19/12/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import Foundation
import RealmSwift

class TaskEntity: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var completed = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(task: Task) {
        self.init()
        self.id = task.id
        self.name = task.name
        self.completed = task.completed
    }
    
    func taskModel() -> Task {
        let model = Task()
        model.id = self.id
        model.name = self.name
        model.completed = self.completed
        return model
    }
}
