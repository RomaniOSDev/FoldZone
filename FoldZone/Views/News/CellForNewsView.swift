//
//  CellForNewsView.swift
//  CardInfoTreining
//
//  Created by Роман Главацкий on 27.07.2025.
//

import SwiftUI

struct CellForNewsView: View {
    let news: Article
    var body: some View {
        VStack(alignment: .center) {
            Text(news.title)
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold, design: .monospaced))
            if let desc = news.description {
                Text(desc).font(.subheadline).foregroundColor(.black)
            }
            Text(news.source?.name ?? "Unknown source").font(.caption).foregroundColor(.gray)
            Text(news.publishedAt?.prefix(10) ?? "").font(.caption2).foregroundColor(.gray)
            Image(systemName: "arrow.right.circle")
                .resizable()
                .frame(width: 32, height: 32)
        }
        .padding()
        .background(Color.white.opacity(0.5).cornerRadius(20))
    }
}


