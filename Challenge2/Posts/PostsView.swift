//
//  PostsView.swift
//  SwiftChallenge2
//
//  Created by Andika Wahyudi on 25/7/26.
//

import SwiftUI

struct PostsView: View {
    let colors: [Color] = [.red, .blue, .green, .orange, .pink]
    
    @State private var currentIndex: Int = 0
    @ObservedObject var firestoreManager: FirestoreManager
    @State private var text = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TabView(selection: $currentIndex) {
                ForEach(0..<firestoreManager.notes.count, id: \.self) { index in
                    ZStack{
                        Rectangle()
                            .fill(colors[index % colors.count])
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                            .frame(height: 380)
                            .padding(.horizontal, 40)
                            .tag(index)
                        
                        Text(firestoreManager.notes[index].text)
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            Text("Post \(firestoreManager.notes.isEmpty ? 0 :currentIndex + 1) of \(firestoreManager.notes.count)")
            
            TextField(
                "Text",
                text: $text
            )
            .border(.black)
            
            HStack{
                Button("Save") {
                    firestoreManager.addNote(text:text)
                    text = ""
                }
                .padding(.horizontal,30)
                
                Button("Delete") {
                    guard !firestoreManager.notes.isEmpty else {return} // if got things delete else nill
                    let noteDelete = firestoreManager.notes[currentIndex] // countes current index(newest text saved)
                    firestoreManager.deleteNote(note: noteDelete) // deletes currentIndex
                }
                
                .foregroundStyle(.red)
                .padding(.horizontal,30)
                // FIXED: This starts the listener when the user opens the screen very IMPT
                .onAppear {
                    firestoreManager.getNotes()
                }
            }
            
        }
        
    }
}


// used gemni help me debug 😅
#Preview {
    PostsView(firestoreManager: FirestoreManager())
}
