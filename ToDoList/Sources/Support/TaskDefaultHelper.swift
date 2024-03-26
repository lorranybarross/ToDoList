//
//  TaskDefaultHelper.swift
//  ToDoList
//
//  Created by Lorrany Barros on 21/03/24.
//

import Foundation

class TaskDefaultHelper {
    private let taskKey = "taskKey"
    
    func saveTaskList(list: [ToDoTask]) {
//        do {
//            let jsonData = try JSONEncoder().encode(list)
//            UserDefaults.standard.setValue(jsonData, forKey: taskKey)
//        } catch {
//            print(error)
//        }
    }
    
    func getTaskList() -> [ToDoTask] {
//        do {
//            guard let list = UserDefaults.standard.object(forKey: taskKey) else { return [] }
//            let tempList = try JSONDecoder().decode([ToDoTask].self, from: list as! Data)
//            return tempList
//        } catch {
//            print(error)
//        }
        
        return []
    }
    
    func updateTask() {
        
    }
    
    func removeTask() {
        
    }
}
