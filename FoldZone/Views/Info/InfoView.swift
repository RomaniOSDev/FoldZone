import SwiftUI

struct InfoView: View {
    var body: some View {
        ZStack {
            Image(.mainBack)
                .resizable()
                .ignoresSafeArea()
            VStack{
                
                
                Image(.infoLabel)
                    .resizable()
                    .padding()
                    
Spacer()
            }.padding()
        }
    }
} 

#Preview {
    InfoView()
}
