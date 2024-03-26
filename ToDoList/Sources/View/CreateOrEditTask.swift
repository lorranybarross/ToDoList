//
//  CreateOrEditTask.swift
//  ToDoList
//
//  Created by Lorrany Barros on 26/03/24.
//

import SwiftUI

struct CreateOrEditTask: View {
    
    let task: ToDoTask?
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var title = ""
    @State private var dateTime = Date()
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                    .clipShape(.rect(cornerRadius: 10))
                
                Section("Date and Time") {
                    DatePicker("", selection: $dateTime, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(.graphical)
                }
                
                HStack {
                    Spacer()
                    
                    // MARK: Delete Button
                    if let task {
                        Button("Delete") {
                            showAlert = true
                        }
                        .buttonStyle(ActionButton())
                        .background(.red)
                        .clipShape(.rect(cornerRadius: 10))
                        .alert("Are you sure?", isPresented: $showAlert) {
                            Button("Cancel", role: .cancel) {}
                            Button("Delete", role: .destructive) {
                                context.delete(task)
                                dismiss()
                            }
                        } message: {
                            Text("If you delete this task you won't be able to access it again.")
                        }
                    }
                    
                    // MARK: Save Button
                    Button("Save") {
                        save()
                        dismiss()
                    }
                    .buttonStyle(ActionButton())
                    .background(.accent)
                    .clipShape(.rect(cornerRadius: 10))
                }
                .listRowBackground(Color.clear)
                
            }
            .navigationTitle("\(task == nil ? "Create" : "Edit") your task")
            .navigationBarTitleDisplayMode(.large)
        }
        .onAppear {
            if let task {
                title = task.title
                dateTime = task.dateTime
            }
        }
    }
    
    func save() {
        if let task {
            // Update task
            task.title = title
            task.dateTime = dateTime
        } else {
            // Add new task
            let task = ToDoTask(
                title: title.isEmpty ? "Untitled" : title,
                dateTime: dateTime
            )
            context.insert(task)
        }
    }
}

#Preview {
    CreateOrEditTask(task: ToDoTask(title: "New task", dateTime: Date()))
}
