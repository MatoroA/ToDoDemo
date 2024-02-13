//
//  ContentView.swift
//  ToDoDemo
//
//  Created by Andani Matoro on 2024/02/12.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            TasksView()
            
            SmallAddButton()
                .onTapGesture {
                    isPresented.toggle()
                }
        }
        .sheet(isPresented: $isPresented, content: {
            AddTaskView()
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

#Preview {
    ContentView()
}

 
