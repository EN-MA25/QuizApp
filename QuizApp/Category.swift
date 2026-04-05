//
//  Category.swift
//  QuizApp
//
//  Created by Erik on 2026-04-05.
//

import Foundation

struct Category: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var cards: [Card]
}
