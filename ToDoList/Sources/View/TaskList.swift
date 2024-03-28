//
//  TaskList.swift
//  ToDoList
//
//  Created by Lorrany Barros on 27/03/24.
//

import SwiftUI
import SwiftData

struct TaskList: View {
    
    @Environment(\.modelContext) private var context
    
    @Query var taskList: [ToDoTask]
    
    init(searchString: String = "") {
        _taskList = Query(filter: #Predicate { task in
            if searchString.isEmpty {
                true
            } else {
                task.title.localizedStandardContains(searchString)
            }
        })
    }
    
    var body: some View {
        List {
            ForEach(taskList) { task in
                NavigationLink {
                    DetailTask(task: task)
                } label: {
                    TaskCard(task: task)
                        .swipeActions(allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                context.delete(task)
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                            
                            NavigationLink {
                                CreateOrEditTask(task: task)
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                        }
                }
            }
            .listRowBackground(Color.gray.opacity(0.1))
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        return TaskList()
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
