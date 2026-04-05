//
//  QuizStorage.swift
//  QuizApp
//
//  Created by Erik on 2026-04-05.
//

import Foundation

class QuizStorage {
    private let key = "quiz_categories"

    func save(categories: [Category]) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(categories) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    func load() -> [Category] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }

        let decoder = JSONDecoder()
        if let decoded = try? decoder.decode([Category].self, from: data) {
            return decoded
        }

        return []
    }
}
