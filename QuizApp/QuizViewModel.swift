//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by Erik on 2026-04-05.
//


import SwiftUI
import Combine

class QuizViewModel: ObservableObject {
    @Published var categories: [Category] = []

    private let storage = QuizStorage()

    init() {
        categories = storage.load()

        if categories.isEmpty {
            categories = [
                Category(name: "Geografi", cards: geographyCards),
                Category(name: "Matematik", cards: mathCards),
                Category(name: "Musik", cards: musicCards)
            ]
            save()
        }
    }

    func save() {
        storage.save(categories: categories)
    }

    func addCategory(name: String) -> Category {
        if let oldCategory = categories.first(where: { $0.name == name }) {
            return oldCategory
        }
        let newCategory = Category(name: name, cards: [])
        categories.append(newCategory)
        save()
        return newCategory
    }

    func addCard(to category: Category, question: String, answers: [String]) {
        guard let index = categories.firstIndex(where: { $0.id == category.id }) else { return }

        let newCard = Card(question: question, answers: answers)
        categories[index].cards.append(newCard)
        save()
    }
    
    func deleteCategory(at offsets: IndexSet) {
        categories.remove(atOffsets: offsets)
        save()
    }
}
