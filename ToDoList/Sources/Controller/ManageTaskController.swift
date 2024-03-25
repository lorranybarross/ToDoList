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
        var list: [ToDoTask]  = TaskDefaultHelper().getTaskList()
        if let index = list.firstIndex(where: { $0.id == task.id }) {
            list[index] = task
        }
        TaskDefaultHelper().saveTaskList(list: list)
    }
    
    func deleteTask(task: ToDoTask) {
        var list: [ToDoTask]  = TaskDefaultHelper().getTaskList()
        if let index = list.firstIndex(where: { $0.id == task.id }) {
            list.remove(at: index)
        }
        TaskDefaultHelper().saveTaskList(list: list)
    }
}
