import SwiftUI

struct QuizTabView: View {
    @State private var selectedDifficulty: QuizDifficulty?
    @State private var startQuiz = false

    var body: some View {
        NavigationView {
            ZStack {
                Image(.mainBack)
                    .resizable()
                    .ignoresSafeArea()
            
                VStack(spacing: 32) {
                    ForEach(QuizDifficulty.allCases) { difficulty in
                        Button(action: {
                            selectedDifficulty = difficulty
                            startQuiz = true
                        }) {
                            Image(difficulty.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                        }
                    }
                    Spacer()
                    NavigationLink(
                        destination: QuizView(difficulty: selectedDifficulty ?? .easy, isActive: $startQuiz),
                        isActive: $startQuiz
                    ) {
                        EmptyView()
                    }
                    .hidden()
                }
                .padding()
            }
        }
    }
    

    func color(for difficulty: QuizDifficulty) -> Color {
        switch difficulty {
        case .easy: return .green
        case .medium: return .yellow
        case .hard: return .red
        }
    }
} 

#Preview {
    QuizTabView()
}
