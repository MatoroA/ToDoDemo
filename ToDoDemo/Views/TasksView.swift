//
//  TasksView.swift
//  ToDoDemo
//
//  Created by Andani Matoro on 2024/02/12.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        VStack {
            Text("My tasks")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            List {
                ForEach(realmManager.tasks, id: \.id) {
                    task in
                    TaskRow(task: task.title, isCompleted: task.completed) {
                        realmManager.updateTask(id: task.id, completed: !task.completed)
                    }
                }
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.black
                UITableViewCell.appearance().backgroundColor = UIColor.green
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

#Preview {
    TasksView()
        .environmentObject(RealmManager())
}
