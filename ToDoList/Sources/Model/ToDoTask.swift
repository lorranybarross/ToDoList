//
//  ToDoTask.swift
//  ToDoList
//
//  Created by Lorrany Barros on 21/03/24.
//

import Foundation
import SwiftData

@Model
class ToDoTask: Identifiable {
    @Attribute(.unique)
    var id: UUID = UUID()
    var title: String
    var details: String?
    var startDate: Date
    var endDate: Date
    @Relationship(deleteRule: .cascade)
    var tags = [Tag]()
    
    init(title: String, details: String? = nil, startDate: Date, endDate: Date) {
        self.details = details
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
    }
    
    func dateToString(date: Date) -> String {
        Date().convertDateToString(date: date, dateFormatter: "dd/MM/yy")
    }
    
    func timeToString(date: Date) -> String {
        Date().convertDateToString(date: date, dateFormatter: "HH:mm")
    }
}
