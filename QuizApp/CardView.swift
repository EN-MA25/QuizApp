//
//  CardView.swift
//  QuizApp
//
//  Created by Erik on 2026-04-02.
//

import SwiftUI

struct CardView: View {

    let card: Card
    var onAnswerSelected: (String) -> Void

    @State private var selectedAnswer: String? = nil
    @State private var showResult = false
    @State private var shuffledAnswers: [String] = []
    

    var body: some View {

        VStack(spacing: 16) {
            Text(card.question)
                .font(.title2)

            ForEach(shuffledAnswers, id: \.self) { answer in
                Button(action: {
                    answerTapped(answer)
                }) {
                    Text(answer)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(backgroundColor(for: answer))
                        .cornerRadius(10)
                }
                .disabled(showResult)
                .opacity(1)
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
        .onAppear {
            shuffledAnswers = card.answers.shuffled()
        }
    }

    func answerTapped(_ answer: String) {
        guard !showResult else { return }
        selectedAnswer = answer
        showResult = true
        onAnswerSelected(answer)

    }
    func backgroundColor(for answer: String) -> Color {
        guard showResult else {
            return Color.blue.opacity(0.2)
        }

        if answer == card.correctAnswer {
            return .green
        }

        if answer == selectedAnswer {
            return .red
        }

        return Color.gray.opacity(0.2)
    }
}

#Preview {
    CardView(
        card: Card(
            question: "Vad är Sveriges huvudstad?",
            answers: ["Stockholm", "Göteborg", "Malmö", "Uppsala"],
            correctAnswer: "Stockholm"
        ),
        onAnswerSelected: test
    )
}

func test(test: String) -> Void {

}
