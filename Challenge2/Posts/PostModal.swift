//
//  PostModal.swift
//  Challenge2
//
//  Created by Lim Shi Hui Serene     on 29/8/26.
//

import Foundation
import FirebaseFirestore

struct Note: Identifiable, Codable {
    @DocumentID var id: String? // if have ignores the document ID portion so it doen not duplicate ID
    var text: String
}

