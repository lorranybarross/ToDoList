//
//  CreateTag.swift
//  ToDoList
//
//  Created by Lorrany Barros on 28/03/24.
//

import SwiftUI

struct CreateTag: View {
    
    @Environment(\.self) var environment
    @Environment(\.modelContext) private var context
    
    @Binding var tags: [Tag]
    @Binding var tagTitle: String
    @Binding var color: Color
    @Binding var isCreatingTag: Bool
    
    @State private var resolveColor = Color.Resolved(red: 0, green: 0, blue: 0)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TextField("New tag", text: $tagTitle)
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(.rect(cornerRadius: 10))
            ColorPicker("Select a color", selection: $color)
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(.rect(cornerRadius: 10))
            Button("Create") {
                createTag()
            }
            .buttonStyle(ActionButton())
            .background(.accent)
            .clipShape(.rect(cornerRadius: 10))
        }
        .frame(minWidth: 300, minHeight: 150)
        .presentationCompactAdaptation(.popover)
        .padding()
    }
    
    func createTag() {
        resolveColor = color.resolve(in: environment)
        let colorFloat: [Float] = [resolveColor.red, resolveColor.green, resolveColor.blue, resolveColor.opacity]
                
        let newTag = Tag(title: tagTitle, color: colorFloat)
        context.insert(newTag)
        tags.append(newTag)

        tagTitle = ""
        isCreatingTag = false
    }
}

#Preview {
    CreateTag(tags: .constant([Tag]()), tagTitle: .constant("Tag 01"), color: .constant(Color.green), isCreatingTag: .constant(true))
}
