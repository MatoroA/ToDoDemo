//
//  AddTaskView.swift
//  ToDoDemo
//
//  Created by Andani Matoro on 2024/02/14.
//

import SwiftUI

struct AddTaskView: View {
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            
            Text("Create new task")
                .font(.title3).bold()
            
            TextField("Enter your task here", text: $title)
                .textFieldStyle(.roundedBorder)
            
            Button {
                print("we are about to cook, adi qale!!!")
                dismiss()
            } label: {
                Text("Add task")
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(hue: 0.328, saturation: 0.796, brightness: 0.408))
                    .cornerRadius(30)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

#Preview {
    AddTaskView()
}
