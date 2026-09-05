//
//  ScoreModal.swift
//  Challenge2
//
//  Created by Lim Shi Hui Serene     on 29/8/26.
//

import Foundation
import FirebaseFirestore

struct HighScore: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var yourScore: Int
}
