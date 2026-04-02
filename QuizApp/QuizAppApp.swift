import SwiftUI

// App phases for simple state-driven navigation
enum AppPhase {
    case start
    case quiz
    case result
}

@main
struct QuizAppApp: App {
    @State private var phase: AppPhase = .start
    @State private var selectedTheme: String = "Geografi"

    var body: some Scene {
        WindowGroup {
            Group {
                switch phase {
                case .start:
                    StartScreen(phase: $phase, selectedTheme: $selectedTheme)
                case .quiz:
                    GameView(phase: $phase, selectedTheme: $selectedTheme)
                case .result:
                    ResultView(score: 0, total: 0) // placeholder result view
                }
            }
        }
    }
}

// Simple result placeholder
struct ResultView: View {
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
              
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}
