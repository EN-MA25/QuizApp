import SwiftUI

struct StartScreen: View {
    @Binding var phase: AppPhase
    @Binding var selectedTheme: String
    @Binding var categories: [Category]

    @State private var showSheet = false

    

    var body: some View {
        NavigationStack {
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
                                    ForEach(categories) { category in
                                        
                                        Text(category.name).tag(category.name)
                                        
                                    }
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
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                }

            }
            .popover(isPresented: $showSheet) {
                AddQuizView()
            }
        }

    }

    private func startQuiz() {
        withAnimation {
            phase = .quiz
        }
    }

    private func addQuiz() {

    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen(
            phase: .constant(AppPhase.start),
            selectedTheme: .constant("Geografi"),
            categories: .constant([])
        )
        .previewDevice("iPhone 14")
    }
}
