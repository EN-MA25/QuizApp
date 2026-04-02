//
//  CardView.swift
//  QuizApp
//
//  Created by Erik on 2026-04-02.
//

import SwiftUI

struct CardView: View {

    let card: Card

    var body: some View {

        VStack(spacing: 16) {
            Text(card.question)
                .font(.title2)

            ForEach(card.answers.shuffled(), id: \.self) { answer in
                Text(answer)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

#Preview {
    CardView(
        card: Card(
            question: "Vad är Sveriges huvudstad?",
            answers: ["Stockholm", "Göteborg", "Malmö", "Uppsala"]
        )
    )
}
