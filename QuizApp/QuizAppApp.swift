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

    @State private var finalScore: Int = 0
    @State private var totalQuestions: Int = 0

    @StateObject var vm = QuizViewModel()
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch phase {
                case .start:
                    StartScreen(
                        phase: $phase,
                        selectedTheme: $selectedTheme,
                        categories: $vm.categories
                    )

                case .quiz:
                    GameView(
                        phase: $phase,
                        selectedTheme: $selectedTheme,
                        finalScore: $finalScore,
                        totalQuestions: $totalQuestions,
                        cards: cards(for: selectedTheme)
                    )

                case .result:
                    ResultView(
                        phase: $phase,
                        score: finalScore,
                        total: totalQuestions
                    )
                }
            }
        }
    }

    func cards(for theme: String) -> [Card] {
        let category = vm.categories.first(where: {$0.name == theme })
        return category?.cards ?? []
    }
}
