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
                        .listRowBackground(Color.accentColor.opacity(0.1))
                    }
                    .scrollContentBackground(.hidden)
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
            Task {
                await loadTasks()
            }
        }
    }
    
    // MARK: - Methods
    func loadTasks() async {
        taskList = TaskDefaultHelper().getTaskList()
    }
}

#Preview {
    InitialTasks()
}
