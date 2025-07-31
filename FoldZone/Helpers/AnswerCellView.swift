//
//  AnswerCellView.swift
//  CardInfoTreining
//
//  Created by Роман Главацкий on 30.07.2025.
//

import SwiftUI

struct AnswerCellView: View {
    let text: String
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(.answerBack)
                    .resizable()
                    
                Text(text)
                    .foregroundStyle(.black)
                    .font(.system(size: 45, weight: .bold))
                    .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.55)
                    .minimumScaleFactor(0.4)
                    .padding(.leading, geo.size.width / 3.5)
                    .padding(.bottom, geo.size.height / 5)
                    
            }.frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

#Preview {
    AnswerCellView(text: "Privasdfsdafsdafsdafsdfsdfsdafsdfdsf sdf sda")
}
