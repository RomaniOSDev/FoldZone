//
//  MoreInfoRulesView.swift
//  CardInfoTreining
//
//  Created by Роман Главацкий on 30.07.2025.
//

import SwiftUI

struct MoreInfoRulesView: View {
    @StateObject var vm: RulesViewModel
    var body: some View {
        ZStack {
            Image(.mainBack)
                .resizable()
                .ignoresSafeArea()
            VStack{
                Image(vm.simpleRules.image)
                    .resizable()
                    .frame(width: 150, height: 150)
                ScrollView{
                    Text(vm.simpleRules.description)
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .bold))
                }
            }.padding()
        }
    }
}

#Preview {
    MoreInfoRulesView(vm: RulesViewModel())
}
