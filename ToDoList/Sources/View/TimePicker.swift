//
//  TimePicker.swift
//  ToDoList
//
//  Created by Lorrany Barros on 21/03/24.
//

import SwiftUI

struct TimePicker: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var time: Date
    
    var delegate: TimePickerProtocol?
    
    var body: some View {
        Spacer()
        NavigationStack {
            VStack(alignment: .center) {
                DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("OK") {
                        guard let delegate = self.delegate else { return }
                        let timeString = Date().convertDateToString(date: time, dateFormatter: "HH:mm")
                        delegate.sendTime(hour: timeString)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    TimePicker(time: .constant(Date()))
}
