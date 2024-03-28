//
//  DetailTask.swift
//  ToDoList
//
//  Created by Lorrany Barros on 26/03/24.
//

import SwiftUI

struct DetailTask: View {
    
    let task: ToDoTask
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 30) {
                if let details = task.details {
                    Text(details)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading) {
                        Text("Start date")
                            .bold()
                        Text("\(task.dateToString(date: task.startDate)) at \(task.timeToString(date: task.startDate))")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("End date")
                            .bold()
                        Text("\(task.dateToString(date: task.endDate)) at \(task.timeToString(date: task.endDate))")
                    }
                }
                .padding()
                .background(.accent.opacity(0.4))
                .clipShape(.rect(cornerRadius: 10))
                
                if !task.tags.isEmpty {
                    Divider()
    
                    VStack(alignment: .leading) {
                        Text("Tags")
                            .font(.title2)
                            .bold()
    
                        HStack {
                            ForEach(task.tags) { tag in
                                Text(tag.title.capitalized)
                                    .padding()
                                    .bold()
                                    .foregroundStyle(.regularMaterial)
                                    .background(Color.Resolved(red: tag.color[0], green: tag.color[1], blue: tag.color[2], opacity: tag.color[3]))
                                    .clipShape(.rect(cornerRadius: 10))
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle(task.title)
            .navigationBarTitleDisplayMode(.large)
            .padding()
        }
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        return DetailTask(task: previewer.task)
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
