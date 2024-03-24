//
//  CreateNewTask.swift
//  ToDoList
//
//  Created by Lorrany Barros on 20/03/24.
//

import SwiftUI

struct CreateNewTask: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var dateAndTime = Set<DateComponents>()
    @State private var showTimePicker = false
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .clipShape(.rect(cornerRadius: 10))
                    .listRowBackground(Color.clear)
                
                Section("Date and Time") {
                    MultiDatePicker("", selection: $dateAndTime)
//                    DatePicker("", selection: $dateAndTime, displayedComponents: [.date, .hourAndMinute])
//                        .datePickerStyle(.graphical)
                }
                
                HStack {
                    Spacer()
                    
                    Button("Save") {
                        let task = ToDoTask(
                            title: title.isEmpty ? "Untitled" : title,
                            dateTime: Date()/*dateAndTime*/
                        )
                        ManageTaskController().createTask(task: task)
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
            .navigationTitle("Create your task")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    CreateNewTask()
}
