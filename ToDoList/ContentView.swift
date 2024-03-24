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
                Text("Desafio App ToDo List\nComece agora:")
                    .multilineTextAlignment(.center)
                
                NavigationLink {
                    InitialTasks()
                } label: {
                    Text("CRIAR TAREFAS")
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        .background(.black)
                        .foregroundStyle(.white.opacity(0.75))
                        .font(.title2)
                        .bold()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
