import SwiftUI

enum QuizDifficulty: String, CaseIterable, Identifiable, Codable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    
    var id: String { rawValue }
    
    var image: ImageResource {
        switch self {
        case .easy:
            return .easyimage
        case .medium:
            return .mediumimage
        case .hard:
            return .hardimage
        }
    }
    
    var smallImage: ImageResource {
        switch self {
        case .easy:
            return .easysmall
        case .medium:
            return .mediumsmall
        case .hard:
            return .hardsmall
        }
    }
    
    var localizedName: String {
        switch self {
        case .easy:
            return "Easy"
        case .medium:
            return "Medium"
        case .hard:
            return "Hard"
        }
    }
} 