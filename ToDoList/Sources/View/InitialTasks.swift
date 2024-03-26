//
//  InitialTasks.swift
//  ToDoList
//
//  Created by Lorrany Barros on 20/03/24.
//

import SwiftUI
import SwiftData

struct InitialTasks: View {
    
    @Query var taskList: [ToDoTask]
        
    var body: some View {
        NavigationStack {
            VStack {
                if taskList.isEmpty {
                    NoTasks()
                } else {
                    List {
                        ForEach(taskList) { task in
                            NavigationLink {
                                CreateOrEditTask(task: task)
                            } label: {
                                TaskCard(task: task)
                            }
                        }
                        .listRowBackground(Color.gray.opacity(0.1))
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
                        CreateOrEditTask(task: nil)
                    } label: {
                        Label("Add Task", systemImage: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    InitialTasks()
}
