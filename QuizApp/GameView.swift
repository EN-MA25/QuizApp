//
//  GameView.swift
//  QuizApp
//
//  Created by Erik on 2026-04-02.
//

import SwiftUI

struct GameView: View {
    
    @Binding var phase: AppPhase
    @Binding var selectedTheme: String
    
    var body: some View {
        Text(selectedTheme)
    }
}

#Preview {
    GameView(phase: .constant(AppPhase.start),
             selectedTheme: .constant("Geografi"))
}
