//
//  ScoreFunc.swift
//  Challenge2
//
//  Created by Lim Shi Hui Serene     on 29/8/26.
//

import SwiftUI
import FirebaseFirestore
import Combine

class ScoreManager: ObservableObject {
    private var db = Firestore.firestore()
    @Published var scores = [HighScore]()
    private var listener: ListenerRegistration? //
    
    // Create Note
    func addNote(playerName: String, yourScore: Int) {
        do {
            _ = try db.collection("Scores").document(playerName).setData(from: HighScore(name: playerName, yourScore: yourScore))//adds the newNote doc in notes collection
        } catch {
            print("Error saving score: \(error)") // in case got error this is a failsafe
        }
    }
    
    // Read Notes
    func getNotes() {
        listener?.remove()
        listener = db.collection("Scores").order(by: "yourScore", descending: true).addSnapshotListener { snapshot, error in
            //sorts in descending alphabetical (.order(by: "model var name", descending: true)) addSnapshotListener triggers when it detects an update
            if let error = error {
                print("Error getting scores: \(error)")
                return
            }
            self.scores = snapshot?.documents.compactMap { document in // loops through the list of data
                try? document.data(as: HighScore.self) // converts the raw text to the Swift note object
            } ?? [] //failsafe, incase got no data default note to blank
        }
    }
    
    
    // Delete Note
    func deleteNote(highScore: HighScore) {
        guard let noteID = highScore.id else { return }
        
        db.collection("Scores").document(noteID).delete { error in
            if let error = error {
                print("Error deleting score: \(error)")
            }
        }
    }
}

