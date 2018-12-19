//
//  LocalTaskRepository.swift
//  ToDoList
//
//  Created by Álvaro Sanz Rodrigo on 19/12/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import RealmSwift

class LocalTaskRepository: Repository {
    
    func getAll() -> [Task] {
        var tasks: [Task] = []
        do{
            let entities = try Realm().objects(TaskEntity.self).sorted(byKeyPath: "name", ascending: true)
            for entity in entities {
                let model = entity.taskModel()
                tasks.append(model)
            }
        }
        catch let error as NSError {
            print("Error getAll Tasks: ", error.description)
        }
        
        return tasks
    }
    
    func get(identifier: String) -> Task? {
        do {
            if let entity = try Realm().objects(TaskEntity.self).filter("id == %@", identifier).first {
                let model = entity.taskModel()
                return model
            }
        } catch {
            return nil
        }
        return nil
    }
    
    func update(a: Task) -> Bool {
        return create(a: a)
    }
    
    func remove(a: Task) -> Bool {
        do {
            try Realm().write {
                let entityToDelete = try Realm().objects(TaskEntity.self).filter("id == %@", a.id)
                try Realm().delete(entityToDelete)
            }
        } catch {
            return false
        }
        return true
    }
    
    func create(a: Task) -> Bool {
        do {
            let entity = TaskEntity(task: a)
            try Realm().write {
                    try Realm().add(entity, update: true)
                }
        } catch {
            return false
        }
        return true
    }

}
