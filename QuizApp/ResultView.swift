//
//  ResultView.swift
//  QuizApp
//
//  Created by Erik on 2026-04-02.
//

import SwiftUI

struct ResultView: View {
    @Binding var phase: AppPhase
    let score: Int
    let total: Int

    var body: some View {
        VStack(spacing: 16) {
            Text("Resultat")
                .font(.title)
                .bold()
            Text("Du fick \(score) av \(total) poäng")
                .font(.body)
            Button("Börja om") {
                withAnimation {
                    phase = .start
                }

            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

#Preview {
    ResultView(phase: .constant(.result), score: 0, total: 0)
}
