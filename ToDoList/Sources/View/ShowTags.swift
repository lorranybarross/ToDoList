//
//  ShowTags.swift
//  ToDoList
//
//  Created by Lorrany Barros on 28/03/24.
//

import SwiftUI
import SwiftData

enum ShowTagType: String {
    case add, remove
}

struct ShowTags: View {
        
    let type: ShowTagType
    let title: String
    
    @Binding var tagListToAdd: [Tag]
    @Binding var tagListToRemove: [Tag]
        
    var body: some View {
        Section(title) {
            ForEach(Array(tagListToRemove.enumerated()), id: \.offset) { index, tag in
                HStack {
                    Text(tag.title)
                    Spacer()
                    Circle()
                        .fill(Color.Resolved(
                            red: tag.color[0],
                            green: tag.color[1],
                            blue: tag.color[2],
                            opacity: tag.color[3]
                        ))
                        .frame(maxWidth: 15, maxHeight: 15)
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button {
                        tagListToAdd.append(tag)
                        tagListToRemove.remove(at: index)
                    } label: {
                        Label("\(type.rawValue.capitalized) Tag",
                              systemImage: (type == .add ? "plus.circle" : "minus.circle.fill"))
                    }
                    .tint(type == .add ? .accent : .gray)
                }
            }
        }
    }
}

#Preview {
    ShowTags(type: .add, title: "Tag 01", tagListToAdd: .constant([Tag]()), tagListToRemove: .constant([Tag]()))
}
