//
//  CreateOrEditTask.swift
//  ToDoList
//
//  Created by Lorrany Barros on 26/03/24.
//

import SwiftUI
import SwiftData

struct CreateOrEditTask: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    let task: ToDoTask?
            
    @State private var title = ""
    @State private var details = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var unselectedTags = [Tag]()
    @State private var tags = [Tag]()
    @State private var tagTitle = ""
    @State private var color = Color.red
    @State private var resolveColor = Color.Resolved(red: 0, green: 0, blue: 0)
    @State private var showAlert = false
    @State private var isCreatingTag = false
    
    @Query var tagList: [Tag]
            
    var body: some View {
        NavigationStack {
            Form {
                Section("Information") {
                    TextField("Title", text: $title)
                    TextField("Details", text: $details, axis: .vertical)
                }
                
                Section("Date and Time") {
                    DatePicker("Start date", selection: $startDate, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(.compact)
                    DatePicker("End date", selection: $endDate, in: startDate.addingTimeInterval(60)..., displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(.compact)
                }
                
                if task != nil {
                    Button {
                        isCreatingTag = true
                    } label: {
                        Label("NEW TAG", systemImage: "square.and.pencil")
                            .bold()
                    }
                    .listRowBackground(Color.clear)
                    .popover(isPresented: $isCreatingTag) {
                        CreateTag(tags: $unselectedTags, tagTitle: $tagTitle, color: $color, isCreatingTag: $isCreatingTag)
                    }
                    
                    ShowTags(type: .remove, title: "Selected tags", tagListToAdd: $unselectedTags, tagListToRemove: $tags)
                    
                    ShowTags(type: .add, title: "Unselected tags", tagListToAdd: $tags, tagListToRemove: $unselectedTags)
                }
                
                HStack {
                    Spacer()
                    
                    // Delete Button
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
                    
                    // Save Button
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
            .onAppear {
                if let task {
                    title = task.title
                    if let details = task.details {
                        self.details = details
                    }
                    startDate = task.startDate
                    endDate = task.endDate
                    tags = task.tags
                    unselectedTags = Array(Set(tagList).subtracting(tags))
                }
            }
        }
    }
    
    func save() {
        if let task {
            // Update task
            task.title = title
            task.details = details
            task.startDate = startDate
            task.endDate = endDate
            task.tags = tags
        } else {
            // Add new task
            let task = ToDoTask(
                title: title.isEmpty ? "Untitled" : title,
                details: details,
                startDate: startDate,
                endDate: endDate
            )
            context.insert(task)
        }
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        return CreateOrEditTask(task: previewer.task)
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
