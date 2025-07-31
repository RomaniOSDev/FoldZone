import Foundation

struct QuizResult: Codable {
    let difficulty: String
    let correctAnswers: Int
    let totalQuestions: Int
    let date: Date
    
    var percentage: Double {
        guard totalQuestions > 0 else { return 0 }
        return Double(correctAnswers) / Double(totalQuestions) * 100
    }
    
    var formattedPercentage: String {
        return String(format: "%.1f%%", percentage)
    }
    
    var scoreText: String {
        return "\(correctAnswers)/\(totalQuestions)"
    }
} 