//
//  ClickerLeaderboardView.swift
//  SwiftChallenge2
//
//  Created by Andika Wahyudi on 25/7/26.
//

import SwiftUI

struct ClickerLeaderboardView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var scoreManager: ScoreManager
    
    var body: some View {
        NavigationStack {
            Group {
                if scoreManager.scores.isEmpty {
                    Text("No Scores Yet")
                    Text("Be the first to get on the leaderboard!")
                } else {
                    List(Array(scoreManager.scores.enumerated()), id: \.element.id) { index, entry in
                        HStack {
                            // Rank Number
                            Text("#\(index + 1)")
                                .font(.headline)
                                .foregroundColor(index < 1 ? .yellow : .secondary)
                                .frame(width: 35, alignment: .leading)
                            
                            // Name & Date
                            VStack(alignment: .leading) {
                                Text(entry.name)
                                    .font(.body)
                                    .fontWeight(.bold)
                            }
                            Spacer()
                            
                            // Score
                            Text("\(entry.yourScore)")
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
            .onAppear {
                scoreManager.getNotes()
            }
        }
    }
}

#Preview {
    ClickerLeaderboardView(scoreManager: ScoreManager())
}
