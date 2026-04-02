import SwiftUI

struct StartScreen: View {
    @Binding var phase: AppPhase
    @Binding var selectedTheme: String

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Image(systemName: "sparkles")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .foregroundStyle(Color.accentColor)

            Text("Välkommen till QuizApp")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)

            Text("Välj ett tema och tryck Start för att börja quizet.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Picker("Tema", selection: $selectedTheme) {
                Text("Geografi").tag("Geografi")
                Text("Mattematik").tag("Mattematik")
                Text("Musik").tag("Musik")
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            Button(action: startQuiz) {
                Label("Start", systemImage: "play.fill")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.horizontal)
            .disabled(selectedTheme.isEmpty)

            Spacer()

            Text("Lycka till!")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .padding()
    }

    private func startQuiz() {
        withAnimation {
            phase = .quiz
        }
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen(
            phase: .constant(AppPhase.start),
            selectedTheme: .constant("Geografi")
        )
        .previewDevice("iPhone 14")
    }
}
