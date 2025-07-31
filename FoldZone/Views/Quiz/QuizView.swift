import SwiftUI

struct QuizQuestion {
    let question: String
    let answers: [String]
    let correctIndex: Int
}

struct QuizView: View {
    let difficulty: QuizDifficulty
    @Binding var isActive: Bool
    @State private var currentIndex = 0
    @State private var correctCount = 0
    @State private var showResult = false
    @State private var selectedAnswer: Int? = nil
    @StateObject private var resultManager = QuizResultManager()
    
    @Environment(\.dismiss) var dismiss

    var questions: [QuizQuestion] {
        switch difficulty {
        case .easy:
            return QuizData.easy
        case .medium:
            return QuizData.medium
        case .hard:
            return QuizData.hard
        }
    }

    var body: some View {
        if showResult {
            QuizResultView(
                correctCount: correctCount,
                total: questions.count,
                onRestart: restart,
                onChooseDifficulty: { isActive = false }
            )
        } else {
            ZStack{
                Image(.mainBack)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    ZStack(alignment: .top){
                        Image(difficulty.smallImage)
                            .resizable()
                            .frame(width: 100, height: 100)
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(.closeButton)
                                    .resizable()
                                    .frame(width: 32, height: 32)
                            }
                            
                            Spacer()
                        }
                    }
                    
                    Spacer()
                    Text(questions[currentIndex].question)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    ForEach(0..<questions[currentIndex].answers.count, id: \..self) { i in
                        Button(action: {
                            selectedAnswer = i
                            if i == questions[currentIndex].correctIndex {
                                correctCount += 1
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                next()
                            }
                        }) {
                        AnswerCellView(text: questions[currentIndex].answers[i])
                                .frame(height: 110)
                        }
                        .disabled(selectedAnswer != nil)
                    }
                }
                .padding()
                .navigationBarBackButtonHidden(true)
            }
        }
    }

    func next() {
        if currentIndex + 1 < questions.count {
            currentIndex += 1
            selectedAnswer = nil
        } else {
            // Save result when quiz is completed
            resultManager.saveResult(
                difficulty: difficulty,
                correctAnswers: correctCount,
                totalQuestions: questions.count
            )
            showResult = true
        }
    }

    func restart() {
        currentIndex = 0
        correctCount = 0
        showResult = false
        selectedAnswer = nil
    }

    func buttonColor(for index: Int) -> Color {
        guard let selected = selectedAnswer else { return .blue }
        if index == selected {
            return index == questions[currentIndex].correctIndex ? .green : .red
        }
        return .blue
    }
}



struct QuizData {
    static let easy: [QuizQuestion] = [
        QuizQuestion(question: "How many cards are dealt to each player in Texas Hold'em?", answers: ["2", "3"], correctIndex: 0),
        QuizQuestion(question: "What is the strongest hand in poker?", answers: ["Royal Flush", "Straight Flush"], correctIndex: 0),
        QuizQuestion(question: "What suit is a spade?", answers: ["Red", "Black"], correctIndex: 1),
        QuizQuestion(question: "What is the minimum number of players in a poker game?", answers: ["1", "2"], correctIndex: 1),
        QuizQuestion(question: "What are community cards?", answers: ["Shared", "Private"], correctIndex: 0),
        QuizQuestion(question: "What is a 'fold'?", answers: ["Pass", "Raise"], correctIndex: 0),
        QuizQuestion(question: "What comes after the flop?", answers: ["Turn", "River"], correctIndex: 0),
        QuizQuestion(question: "What do you call a forced bet before cards are dealt?", answers: ["Blind", "Ante"], correctIndex: 0),
        QuizQuestion(question: "Which hand beats a straight?", answers: ["Flush", "Two Pair"], correctIndex: 0),
        QuizQuestion(question: "What is the first round of betting called?", answers: ["Preflop", "Turn"], correctIndex: 0)
    ]
    static let medium: [QuizQuestion] = [
        QuizQuestion(question: "How many cards are on the board in Texas Hold'em?", answers: ["5", "4"], correctIndex: 0),
        QuizQuestion(question: "What is a 'full house'?", answers: ["Three and Pair", "Two Pairs"], correctIndex: 0),
        QuizQuestion(question: "What is the lowest possible hand in poker?", answers: ["High Card", "Pair"], correctIndex: 0),
        QuizQuestion(question: "What is 'check'?", answers: ["Bet", "No Bet"], correctIndex: 1),
        QuizQuestion(question: "What beats two pair?", answers: ["Three of a Kind", "One Pair"], correctIndex: 0),
        QuizQuestion(question: "What is a 'kicker'?", answers: ["High Card", "Low Pair"], correctIndex: 0),
        QuizQuestion(question: "What is the term for betting all your chips?", answers: ["All-in", "Fold"], correctIndex: 0),
        QuizQuestion(question: "What is the term for revealing cards at the end?", answers: ["Showdown", "Turn"], correctIndex: 0),
        QuizQuestion(question: "What is the fifth community card called?", answers: ["River", "Flop"], correctIndex: 0),
        QuizQuestion(question: "What hand is better than a flush but worse than a straight flush?", answers: ["Full House", "Two Pair"], correctIndex: 0)
    ]
    static let hard: [QuizQuestion] = [
        QuizQuestion(question: "What is the probability of hitting a flush on the flop?", answers: ["0.8%", "5%"], correctIndex: 0),
        QuizQuestion(question: "What is 'slow play'?", answers: ["Trap", "Bluff"], correctIndex: 0),
        QuizQuestion(question: "What does 'under the gun' mean?", answers: ["First to Act", "Dealer"], correctIndex: 0),
        QuizQuestion(question: "What is ICM?", answers: ["Chip Value", "Pot Odds"], correctIndex: 0),
        QuizQuestion(question: "What is the nut hand?", answers: ["Best Possible", "Second Best"], correctIndex: 0),
        QuizQuestion(question: "What is a squeeze play?", answers: ["Re-Raise", "Check"], correctIndex: 0),
        QuizQuestion(question: "What is a 'gutshot' draw?", answers: ["Inside Straight", "Open Straight"], correctIndex: 0),
        QuizQuestion(question: "What is a 'set'?", answers: ["Three of a Kind", "Two Pair"], correctIndex: 0),
        QuizQuestion(question: "What is 'floating' in poker?", answers: ["Bluff Later", "Slow Play"], correctIndex: 0),
        QuizQuestion(question: "What does 'fold equity' refer to?", answers: ["Chance to Fold", "Value Bet"], correctIndex: 0)
    ]
} 

#Preview {
    QuizTabView()
}
