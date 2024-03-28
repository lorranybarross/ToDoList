//
//  Previewer.swift
//  ToDoList
//
//  Created by Lorrany Barros on 26/03/24.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
struct Previewer {
    let container: ModelContainer
    let task: ToDoTask
    
    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: ToDoTask.self, configurations: config)
        
        task = ToDoTask(title: "Task 01",
                        details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras non lorem elementum, tincidunt sem sit amet, sodales augue. Mauris lorem dolor, placerat non dignissim vel, elementum vel velit.",
                        startDate: Date(),
                        endDate: Date())
        
        container.mainContext.insert(task)
    }
}
