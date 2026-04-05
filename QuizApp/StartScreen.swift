import SwiftUI

struct StartScreen: View {
    @Binding var phase: AppPhase
    @Binding var selectedTheme: String
    @ObservedObject var vm: QuizViewModel

    @State private var showSheet = false
    @State private var selectedCategory: Category?

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

                
                List {
                    ForEach(vm.categories) { category in
                        HStack {
                            Text(category.name)
                            Spacer()
                            if selectedCategory?.id == category.id {
                                Image(systemName: "checkmark")
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedCategory = category
                            selectedTheme = category.name
                        }
                    }
                }
                
                
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
                        withAnimation {
                            phase = .addCategory
                        }

                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                }

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
            vm: QuizViewModel()
        )
        .previewDevice("iPhone 14")
    }
}
