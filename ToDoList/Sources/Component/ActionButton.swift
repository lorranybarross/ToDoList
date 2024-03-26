//
//  ActionButton.swift
//  ToDoList
//
//  Created by Lorrany Barros on 26/03/24.
//

import Foundation
import SwiftUI

struct ActionButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal)
            .padding(.vertical, 10)
            .foregroundStyle(.white)
            .font(.headline)
    }
}
