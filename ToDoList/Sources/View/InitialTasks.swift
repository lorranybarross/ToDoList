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
        
    @State private var searchText = ""
            
    var body: some View {
        NavigationStack {
            VStack {
                if taskList.isEmpty {
                    NoTasks()
                } else {
                    TaskList(searchString: searchText)
                }
                
                Spacer()
            }
            .navigationTitle("ToDo List")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        CreateOrEditTask(task: nil)
                    } label: {
                        Label("Add Task", systemImage: "plus")
                    }
                }
            }
            .searchable(text: $searchText, isPresented: .constant(!taskList.isEmpty), placement: .navigationBarDrawer(displayMode: .automatic))
        }
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        return InitialTasks()
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
