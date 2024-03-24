//
//  EditTask.swift
//  ToDoList
//
//  Created by Lorrany Barros on 22/03/24.
//

import SwiftUI

struct EditTask: View {
    
    let task: ToDoTask
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = "Hi"
    @State private var dateAndTime = Date()
//    @State private var date = ""
//    @State private var time = ""
//    @State private var showTimePicker = false
    
    func loadInfo() {
        self.title = task.title
        self.dateAndTime = task.dateTime
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextEditor(text: $title)
                    .clipShape(.rect(cornerRadius: 10))
                
                Section("Date and Time") {
                    DatePicker("", selection: $dateAndTime, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(.graphical)
                }
                
                HStack {
                    Spacer()
                    
                    Button("Save") {
//                        let task = ToDoTask(
//                            title: title.isEmpty ? "Untitled" : title,
//                            date: date,
//                            time: time
//                        )
//                        ManageTaskController().createTask(task: task)
                        dismiss()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .font(.headline)
                    .clipShape(.rect(cornerRadius: 10))
                }
                .listRowBackground(Color.clear)
                
            }
            .navigationTitle("Edit your task")
            .navigationBarTitleDisplayMode(.large)
            
        }
        .onAppear {
            loadInfo()
        }
    }
}

#Preview {
    let example = ToDoTask(title: "My new task", dateTime: Date())
    return EditTask(task: example)
}
