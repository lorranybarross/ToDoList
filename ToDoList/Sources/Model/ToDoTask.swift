//
//  ToDoTask.swift
//  ToDoList
//
//  Created by Lorrany Barros on 21/03/24.
//

import Foundation

@Observable
class ToDoTask: Identifiable, Codable {
    let id: UUID
    var title: String
    var dateTime: Date
    
    init(id: UUID = UUID(), title: String, dateTime: Date) {
        self.id = id
        self.title = title
        self.dateTime = dateTime
    }
    
    func dateToString() -> String {
        Date().convertDateToString(date: dateTime, dateFormatter: "dd/MM/yyyy")
    }
    
    func timeToString() -> String {
        Date().convertDateToString(date: dateTime, dateFormatter: "HH:mm")
    }
}
