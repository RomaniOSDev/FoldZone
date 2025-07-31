import SwiftUI

struct RulesView: View {
    
    @StateObject var vm = RulesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.mainBack)
                    .resizable()
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        Text("POKER RULES")
                            .foregroundStyle(.white)
                            .font(.system(size: 32, weight: .bold))
                        LazyVGrid(columns: [GridItem(), GridItem()]) {
                            ForEach(Rules.allCases, id: \.self) { rules in
                                Button {
                                    vm.tapOnRules(rules: rules)
                                } label: {
                                    Image(rules.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                }

                                
                            }
                        }
                        
                    }
                }
            }
            .navigationDestination(isPresented: $vm.isPresented) {
                MoreInfoRulesView(vm: vm)
            }
        }
        }
    
} 

#Preview {
    RulesView()
}
