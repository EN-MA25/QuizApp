import SwiftUI

struct ResultView: View {
    @Binding var phase: AppPhase
    var score: Int
    var total: Int

    var body: some View {
        VStack(spacing: 20) {
            Text("Resultat")
                .font(.largeTitle)

            Text("\(score) av \(total) rätt")
                .font(.title)

            Button("Spela igen") {
                phase = .start
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ResultView(
        phase: .constant(.result),
        score: 3,
        total: 5
    )
}