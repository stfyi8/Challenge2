//
//  Challenge2App.swift
//  Challenge2
//
//  Created by Lim Shi Hui Serene     on 4/7/26.
//

import SwiftUI
import FirebaseCore


@main
struct Challenge2App: App {
    init(){
           FirebaseApp.configure()
           print("configured Firebase")
       }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
