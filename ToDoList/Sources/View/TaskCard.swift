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
        VStack(alignment: .leading, spacing: 10) { 
            HStack {
                HStack {
                    Text("Date:")
                        .fontWeight(.heavy)
                    if Calendar.current.isDateInToday(task.dateTime) {
                        Text("Today")
                    } else if Calendar.current.isDateInTomorrow(task.dateTime) {
                        Text("Tomorrow")
                    } else {
                        Text(task.dateToString())
                    }
                }
                
                Spacer()
                
                HStack {
                    Text("Time:")
                        .fontWeight(.heavy)
                    Text(task.timeToString())
                }
            }
            
            Text(task.title)
                .font(.title3)            
        }
    }
}

#Preview {
    let example = ToDoTask(title: "My new task", dateTime: Date())
    return TaskCard(task: example)
}
