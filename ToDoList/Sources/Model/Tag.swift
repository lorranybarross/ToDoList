//
//  Tag.swift
//  ToDoList
//
//  Created by Lorrany Barros on 27/03/24.
//

import Foundation
import SwiftData

@Model
class Tag: Identifiable {
    @Attribute(.unique)
    var id: UUID = UUID()
    var title: String
    var color: [Float]
    var task: ToDoTask?
    
    init(title: String, color: [Float]) {
        self.title = title
        self.color = color
    }
}
