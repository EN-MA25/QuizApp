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
    @State private var currentScore: Int = 0

    @State private var showNextButton: Bool = false

    let cards: [Card]

    var body: some View {
        let card = cards[currentIndex]

        VStack {
            Text("Du har \(currentScore)/\(cards.count) rätt")
            ZStack {
                
                CardView(card: card) { answer in
                    handleAnswer(answer, for: card)
                }
                .id(currentIndex)
                // transition not working on onAppear in CardView
                // If I don't use onAppear it will shuffle the cards on each redraw.
                // Will try to fix it later
                // Erik
                //                    .transition(
                //                        .asymmetric(
                //                            insertion: .move(edge: .trailing),
                //                            removal: .move(edge: .leading)
                //                        )
                //                    )
            }
            .animation(.easeInOut(duration: 0.4), value: currentIndex)

            Button("Nästa fråga") {
                nextCard()
                showNextButton = false
            }.opacity(showNextButton ? 1 : 0)

        
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

    func handleAnswer(_ answer: String, for card: Card) {
        showNextButton = true
        if answer == card.correctAnswer {
            currentScore += 1
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
