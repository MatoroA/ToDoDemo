//
//  SmallAddButton.swift
//  ToDoDemo
//
//  Created by Andani Matoro on 2024/02/14.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(hue: 0.328, saturation: 0.796, brightness: 0.408))
            
            Image(systemName: "plus")
                .font(.title3)
                .foregroundColor(.white)
        }
        .frame(width: 50, height: 50)
    }
}

#Preview {
    SmallAddButton()
}
