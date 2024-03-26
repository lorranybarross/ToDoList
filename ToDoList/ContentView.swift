//
//  ContentView.swift
//  ToDoList
//
//  Created by Lorrany Barros on 20/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                Text("App ToDo List Challenge\nStart now:")
                    .multilineTextAlignment(.center)
                
                NavigationLink {
                    InitialTasks()
                } label: {
                    Text("CREATE TASKS")
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        .background(.accent)
                        .foregroundStyle(.white.opacity(0.75))
                        .font(.title2)
                        .bold()
                        .clipShape(.rect(cornerRadius: 20))
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
