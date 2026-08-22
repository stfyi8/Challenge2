//
//  ClickerLeaderboardView.swift
//  SwiftChallenge2
//
//  Created by Andika Wahyudi on 25/7/26.
//

import SwiftUI

struct ClickerLeaderboardView: View {
    @Environment(\.dismiss) private var dismiss
    
    struct LeaderboardEntry: Identifiable {
        let id = UUID()
        let name: String
        let score: Int
    }
    
    @State private var entries: [LeaderboardEntry] = [
        LeaderboardEntry(name: "Serene", score: 42),
        LeaderboardEntry(name: "Andika", score: 28),
        LeaderboardEntry(name: "Sparky", score: 27),
        LeaderboardEntry(name: "Jiachen", score: 15)
    ]

    var body: some View {
        NavigationStack {
            Group {
                if entries.isEmpty {
                    VStack {
                        Text("No Scores Yet")
                        Text("Be the first to get on the leaderboard!")
                    }
                } else {
                    List(Array(entries.enumerated()), id: \.offset) { index, entry in
                        HStack {
                            // Rank Number
                            Text("#\(index + 1)")
                                .font(.headline)
                                .foregroundColor(index < 1 ? .yellow : .secondary)
                                .frame(width: 35, alignment: .leading)
                            
                            // Name
                            VStack(alignment: .leading) {
                                Text("\(entry.name)")
                                    .font(.body)
                                    .fontWeight(.bold)
                            }
                            Spacer()
                            
                            // Score
                            Text("\(entry.score)")
                                .font(.title3)
                                .fontWeight(.heavy)
                        }
                    }
                }
            }
            .navigationTitle("Leaderboard")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

#Preview {
    ClickerLeaderboardView()
}
