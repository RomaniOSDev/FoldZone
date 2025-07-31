//
//  QuizResultView.swift
//  CardInfoTreining
//
//  Created by Роман Главацкий on 30.07.2025.
//

import SwiftUI

struct QuizResultView: View {
    let correctCount: Int
    let total: Int
    let onRestart: () -> Void
    let onChooseDifficulty: () -> Void

    var body: some View {
        ZStack{
            Image(.mainBack)
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 24) {
                Image(.resultLabel)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 95)
                Image(.finish)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                Text("Correct answers: \(correctCount) out of \(total)")
                    .font(.title2)
                    .foregroundStyle(.white)
                VStack(spacing: 20) {
                    Button {
                        onRestart()
                    } label: {
                        Image(.nextLevelButton)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }

                    Button {
                        onChooseDifficulty()
                    } label: {
                        Image(.finishButton)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }

                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    QuizResultView(correctCount: 1, total: 2, onRestart: {}, onChooseDifficulty: {})
}
