import Foundation

enum AppPhase: String, CaseIterable, Codable, Equatable {
    case start
    case quiz
    case result

  
    var id: String { rawValue }
}
