//
//  TaskCard.swift
//  ToDoList
//
//  Created by Lorrany Barros on 21/03/24.
//

import SwiftUI

struct TaskCard: View {
    
    let task: ToDoTask
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(task.title)
                    .bold()
                    .foregroundStyle(.primary)
                
                if let details = task.details {
                    Text(details)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                        .font(.subheadline)
                } else {
                    Text("")
                        .lineLimit(2)
                        .font(.subheadline)
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                // Date
                HStack(spacing: 5) {
                    // Start date
                    if Calendar.current.isDateInToday(task.startDate) {
                        Text("Today")
                    } else if Calendar.current.isDateInTomorrow(task.startDate) {
                        Text("Tomorrow")
                    } else {
                        Text(task.dateToString(date: task.startDate))
                    }
                    
                    // End date
                    if task.dateToString(date: task.startDate) != task.dateToString(date: task.endDate) {
                        if Calendar.current.isDateInToday(task.endDate) {
                
                        } else if Calendar.current.isDateInTomorrow(task.endDate) {
                            Text("- Tomorrow")
                        } else {
                            Text("- \(task.dateToString(date: task.endDate))")
                        }
                    }
                }
                
                // Time
                if task.timeToString(date: task.startDate) == task.timeToString(date: task.endDate) {
                    Text(task.timeToString(date: task.startDate))
                } else {
                    Text("\(task.timeToString(date: task.startDate)) - \(task.timeToString(date: task.endDate))")
                }
                
                // Tags
                HStack {
                    ForEach(task.tags) { tag in
                        Circle()
                            .fill(
                                Color.Resolved(red: tag.color[0],
                                               green: tag.color[1],
                                               blue: tag.color[2],
                                               opacity: tag.color[3])
                            )
                            .frame(maxWidth: 15, maxHeight: 15)
                            .shadow(radius: 1)
                    }
                }
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        return TaskCard(task: previewer.task)
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
