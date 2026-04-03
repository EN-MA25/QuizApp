import SwiftUI

struct GameView: View {

    @Binding var phase: AppPhase
    @Binding var selectedTheme: String
    @Binding var finalScore: Int
    @Binding var totalQuestions: Int

    @State private var currentIndex = 0
    @State private var currentScore: Int = 0
    @State private var showNextButton: Bool = false

    let cards: [Card]

    var body: some View {
        let card = cards[currentIndex]

        VStack(spacing: 20) {

            Text("Fråga \(currentIndex + 1) / \(cards.count)")
                .font(.headline)

            Text("Du har \(currentScore)/\(cards.count) rätt")
                .font(.subheadline)

            ZStack {
                CardView(card: card) { answer in
                    handleAnswer(answer, for: card)
                }
                .id(currentIndex)
            }
            .animation(.easeInOut(duration: 0.4), value: currentIndex)

            Button("Nästa fråga") {
                nextCard()
                showNextButton = false
            }
            .buttonStyle(.borderedProminent)
            .opacity(showNextButton ? 1 : 0)
        }
        .padding()
    }

    func nextCard() {
        if currentIndex < cards.count - 1 {
            currentIndex += 1
        } else {
            finalScore = currentScore
            totalQuestions = cards.count

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
        finalScore: .constant(0),
        totalQuestions: .constant(5),
        cards: [
            Card(
                question: "Vad är Sveriges huvudstad?",
                answers: ["Stockholm", "Göteborg", "Malmö", "Uppsala"],
                correctAnswer: "Stockholm"
            )
        ]
    )
}
