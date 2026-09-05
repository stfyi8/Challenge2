//
//  PostFunc.swift
//  Challenge2
//
//  Created by Lim Shi Hui Serene     on 29/8/26.
//

import SwiftUI
import FirebaseFirestore
import Combine

class FirestoreManager: ObservableObject {
    private var db = Firestore.firestore()
    @Published var notes = [Note]()
    
    // Create Note
    func addNote(text: String) {
        let newNote = Note(text: text)
        
        do {
            _ = try db.collection("notes").addDocument(from: newNote) //adds the newNote doc in notes collection
        } catch {
            print("Error adding document: \(error)") // in case got error this is a failsafe
        }
    }
    
    // Read Notes
    func getNotes() {
        db.collection("notes").order(by: "text").addSnapshotListener { snapshot, error in
            //sorts in alphabetical (.order(by: "model var name")) addSnapshotListener triggers when it detects an update
            if let error = error {
                print("Error getting notes: \(error)")
                return
            }
            
            self.notes = snapshot?.documents.compactMap { document in // loops through the list of data
                try? document.data(as: Note.self) // converts the raw text to the Swift note object
            } ?? [] //failsafe, incase got no data default note to blank
        }
    }
    
    // Delete Note
    func deleteNote(note: Note) {
        guard let noteID = note.id else { return }
        
        db.collection("notes").document(noteID).delete { error in
            if let error = error {
                print("Error deleting note: \(error)")
            }
        }
    }
}


