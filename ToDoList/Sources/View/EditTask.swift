//
//  EditTask.swift
//  ToDoList
//
//  Created by Lorrany Barros on 22/03/24.
//

import SwiftUI

struct EditTask: View {
    
    @Bindable var task: ToDoTask
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            Form {
                TextEditor(text: $task.title)
                    .clipShape(.rect(cornerRadius: 10))
                
                Section("Date and Time") {
                    DatePicker("Data and Time", selection: $task.dateTime, in: Date()...)
                        .datePickerStyle(.graphical)
                }
                
                HStack {
                    Spacer()
                    
                    // MARK: Delete Button
                    Button("Delete") {
                        showAlert = true
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(.red)
                    .foregroundStyle(.white)
                    .font(.headline)
                    .clipShape(.rect(cornerRadius: 10))
                    .alert("Are you sure?", isPresented: $showAlert) {
                        Button("OK") {}
                    }
                    
                    // MARK: Save Button
                    Button("Save") {
                        ManageTaskController().updateTask(task: task)
                        dismiss()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(.accent)
                    .foregroundStyle(.white)
                    .font(.headline)
                    .clipShape(.rect(cornerRadius: 10))
                }
                .listRowBackground(Color.clear)
                
            }
            .navigationTitle("Edit your task")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    let example = ToDoTask(title: "My new task", dateTime: Date().addingTimeInterval(86400 * 3))
    return EditTask(task: example)
}
