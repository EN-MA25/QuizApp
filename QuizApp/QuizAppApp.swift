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
                    GameView(
                        phase: $phase,
                        selectedTheme: $selectedTheme,
                        cards: cards(for: selectedTheme)
                    )
                case .result:
                    ResultView(phase: $phase, score: 0, total: 0)  // placeholder result view
                }
            }
        }
    }

    func cards(for theme: String) -> [Card] {
        switch theme {
        case "Geografi":
            return geographyCards
        case "Mattematik":
            return mathCards
        case "Musik":
            return musicCards
        default:
            return []
        }
    }
}

// Simple result placeholder
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
