//
//  Card.swift
//  QuizApp
//
//  Created by Erik on 2026-04-02.
//

import Foundation

struct Card: Identifiable {
    init(question: String, answers: [String]) {
        self.id = UUID()
        self.question = question
        self.correctAnswer = answers.first
        self.answers = answers.shuffled()
    }
    
    var id: UUID
    var question: String
    var correctAnswer: String?
    var answers: [String]
}
