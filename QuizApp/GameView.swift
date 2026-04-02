//
//  GameView.swift
//  QuizApp
//
//  Created by Erik on 2026-04-02.
//

import SwiftUI

struct GameView: View {

    @Binding var phase: AppPhase
    @Binding var selectedTheme: String

    @State private var currentIndex = 0

    let cards: [Card]

    var body: some View {

        VStack {
            Spacer()

            ZStack {
                CardView(card: cards[currentIndex])
                    .id(currentIndex)
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        )
                    )
            }
            .animation(.easeInOut(duration: 0.4), value: currentIndex)

            Spacer()

            Button("Nästa fråga") {
                nextCard()
            }
        }
        .padding()
    }

    func nextCard() {
        if currentIndex < cards.count - 1 {
            currentIndex += 1
        } else {
            withAnimation {
                phase = .result
            }
        }
    }
}

#Preview {
    GameView(
        phase: .constant(AppPhase.start),
        selectedTheme: .constant("Geografi"),
        cards: [
            Card(
                question: "Vad är Sveriges huvudstad?",
                answers: ["Stockholm", "Göteborg", "Malmö", "Uppsala"]
            )
        ]
    )
}
