//
//  ContentView.swift
//  Challenge2
//
//  Created by Lim Shi Hui Serene     on 4/7/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Clicker", systemImage: "pointer.arrow.ipad.rays") {
                ClickerView()
            }
            Tab("Posts", systemImage: "square.and.arrow.up.on.square.fill") {
                PostsView()
            }

        }
    }
}

#Preview {
    ContentView()
}
