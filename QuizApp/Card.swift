//
//  Card.swift
//  QuizApp
//
//  Created by Erik on 2026-04-02.
//

import Foundation

struct Card: Identifiable {
    var id: UUID = UUID()
    var question: String
    var answers: [String]
    var correctAnswer: String
}
