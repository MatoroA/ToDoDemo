//
//  ContentView.swift
//  ToDoDemo
//
//  Created by Andani Matoro on 2024/02/12.
//

import SwiftUI

struct ContentView: View {
    @StateObject var realmManager = RealmManager()
    @State private var isPresented: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            TasksView()
                .environmentObject(realmManager)
            
            SmallAddButton()
                .onTapGesture {
                    isPresented.toggle()
                }
        }
        .sheet(isPresented: $isPresented, content: {
            AddTaskView()
                .environmentObject(realmManager)
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

#Preview {
    ContentView()
}

 
