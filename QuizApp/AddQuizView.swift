//
//  AddQuizView.swift
//  QuizApp
//
//  Created by Erik on 2026-04-05.
//

import SwiftUI

struct AddQuizView: View {
    
    @Binding var phase: AppPhase
    @ObservedObject var vm: QuizViewModel
    
    @State private var categoryName = ""
    @State private var questionText = ""
    @State private var answer1 = ""
    @State private var answer2 = ""
    @State private var answer3 = ""
    @State private var answer4 = ""
    
    @State private var cards: [Card] = []
    
    
    var body: some View {
        VStack {
            Text("Lägg till frågor")
            TextField("Kategori ...", text: $categoryName)
                .font(.body)
                .padding(.horizontal, 4)
                .frame(height: 35)
            TextField("Fråga ...", text: $questionText)
                .font(.body)
                .padding(.horizontal, 4)
                .frame(height: 35)
            TextField("Svar 1 (Korrekta Svaret)", text: $answer1)
                .font(.body)
                .padding(.horizontal, 4)
                .frame(height: 35)
            TextField("Svar 2", text: $answer2)
                .font(.body)
                .padding(.horizontal, 4)
                .frame(height: 35)
            TextField("Svar 3", text: $answer3)
                .font(.body)
                .padding(.horizontal, 4)
                .frame(height: 35)
            TextField("Svar 4", text: $answer4)
                .font(.body)
                .padding(.horizontal, 4)
                .frame(height: 35)
            HStack(spacing: 40) {
                Button("Spara") {
                    if !questionText.isEmpty, !answer1.isEmpty, !answer2.isEmpty, !answer3.isEmpty, !answer4.isEmpty {
                    
                        let category = vm.addCategory(name: categoryName)
                        vm.addCard(to: category, question: questionText, answers: [answer1, answer2, answer3, answer4])
                        questionText = ""
                        answer1 = ""
                        answer2 = ""
                        answer3 = ""
                        answer4 = ""
                        
                    }
                    
                }
                Button("Klar") {
                    phase = .start
                }
            }
        }
    
    }
}

#Preview {
    AddQuizView(
        phase: .constant(AppPhase.addCategory),
        vm: QuizViewModel()
    )
}
