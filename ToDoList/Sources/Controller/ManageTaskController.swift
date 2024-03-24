//
//  ManageTaskController.swift
//  ToDoList
//
//  Created by Lorrany Barros on 20/03/24.
//

import Foundation

class ManageTaskController {    
    func createTask(task: ToDoTask) {
        var list: [ToDoTask] = TaskDefaultHelper().getTaskList()
        list.append(task)
        TaskDefaultHelper().saveTaskList(list: list)
    }
    
    func updateTask(task: ToDoTask) {
        
    }
}
