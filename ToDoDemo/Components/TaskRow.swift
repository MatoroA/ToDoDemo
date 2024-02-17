//
//  TaskRow.swift
//  ToDoDemo
//
//  Created by Andani Matoro on 2024/02/12.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var isCompleted: Bool
    var onTap: ()-> Void
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: isCompleted ? "checkmark.circle": "circle")
            Text(task)
                .font(.title2)
        }
        .onTapGesture {
            onTap()
        }
    }
}

#Preview {
    TaskRow(task: "Task one test", isCompleted: false) {
        print("Task item on clicked")
    }
}
