//
//  NoTasks.swift
//  ToDoList
//
//  Created by Lorrany Barros on 21/03/24.
//

import SwiftUI

struct NoTasks: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("You don't have any tasks yet.")
                .font(.callout)
            NavigationLink {
                CreateOrEditTask(task: nil)
            } label: {
                Label("Create a new task", systemImage: "pencil")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.primary)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .clipShape(.rect(cornerRadius: 10))
            }
        }
    }
}

#Preview {
    NoTasks()
}
