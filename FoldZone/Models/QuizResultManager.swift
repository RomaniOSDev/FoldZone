import Foundation

class QuizResultManager: ObservableObject {
    @Published var results: [QuizResult] = []
    
    private let userDefaults = UserDefaults.standard
    private let resultsKey = "QuizResults"
    
    init() {
        loadResults()
    }
    
    func saveResult(difficulty: QuizDifficulty, correctAnswers: Int, totalQuestions: Int) {
        let result = QuizResult(
            difficulty: difficulty.localizedName,
            correctAnswers: correctAnswers,
            totalQuestions: totalQuestions,
            date: Date()
        )
        
        // Remove previous result for this difficulty if it exists
        results.removeAll { $0.difficulty == difficulty.localizedName }
        
        // Add new result
        results.append(result)
        
        // Save to UserDefaults
        saveResults()
    }
    
    func getResult(for difficulty: QuizDifficulty) -> QuizResult? {
        return results.first { $0.difficulty == difficulty.localizedName }
    }
    
    private func saveResults() {
        if let encoded = try? JSONEncoder().encode(results) {
            userDefaults.set(encoded, forKey: resultsKey)
        }
    }
    
    private func loadResults() {
        if let data = userDefaults.data(forKey: resultsKey),
           let decoded = try? JSONDecoder().decode([QuizResult].self, from: data) {
            results = decoded
        }
    }
} 