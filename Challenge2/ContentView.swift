//
//  ContentView.swift
//  Challenge2
//
//  Created by Lim Shi Hui Serene     on 4/7/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.accentColor
            VStack{
               
                Text("Serene")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .bold()
                
                Text("burger")
                    .foregroundStyle(.red)
                    .bold()
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
