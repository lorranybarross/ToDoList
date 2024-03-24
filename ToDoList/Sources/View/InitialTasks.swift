//
//  InitialTasks.swift
//  ToDoList
//
//  Created by Lorrany Barros on 20/03/24.
//

import SwiftUI

struct InitialTasks: View {
    
    @State private var taskList = [ToDoTask]()
    
    var body: some View {
        NavigationStack {
            VStack {
                // MARK: List
                if taskList.isEmpty {
                    NoTasks()
                } else {
                    List {
                        ForEach(taskList) { task in
                            NavigationLink {
                                EditTask(task: task)
                            } label: {
                                TaskCard(task: task)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle("ToDo List")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarBackButtonHidden()
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        CreateNewTask()
                    } label: {
                        Label("Add Task", systemImage: "plus")
                    }
                }
            }
        }
        .onAppear {
            loadTasks()
        }
    }
    
    // MARK: - Methods
    func loadTasks() {
        taskList = TaskDefaultHelper().getTaskList()
    }
}

#Preview {
    InitialTasks()
}
