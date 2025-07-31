//
//  ResultView.swift
//  CardInfoTreining
//
//  Created by Роман Главацкий on 30.07.2025.
//

import SwiftUI

struct ResultView: View {
    @StateObject private var resultManager = QuizResultManager()
    
    var body: some View {
        ZStack {
            Image(.mainBack)
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Quiz Results")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.top)
                
                if resultManager.results.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "questionmark.circle")
                            .font(.system(size: 60))
                            .foregroundStyle(.gray)
                        
                        Text("No Results")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        
                        Text("Take a quiz to see results")
                            .font(.body)
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                } else {
                    ScrollView {
                        VStack(spacing: 0) {
                            // Table header
                            HStack {
                                Text("Difficulty")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("Result")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .padding()
                            .background(Color.black.opacity(0.3))
                            
                            // Results
                            ForEach(resultManager.results, id: \.difficulty) { result in
                                HStack {
                                    Text(result.difficulty)
                                        .font(.body)
                                        .foregroundStyle(.white)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    VStack(alignment: .trailing, spacing: 4) {
                                        Text(result.scoreText)
                                            .font(.body)
                                            .foregroundStyle(.white)
                                        
                                        Text(result.formattedPercentage)
                                            .font(.caption)
                                            .foregroundStyle(.green)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding()
                                .background(Color.white.opacity(0.1))
                                
                                if result.difficulty != resultManager.results.last?.difficulty {
                                    Divider()
                                        .background(Color.white.opacity(0.3))
                                }
                            }
                        }
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(12)
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ResultView()
}
