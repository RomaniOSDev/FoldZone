import SwiftUI
import StoreKit

struct SettingsView: View {
    @State private var showResult: Bool = false
    var body: some View {
        ZStack {
            Image(.mainBack)
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("Settings")
                    .foregroundStyle(.white)
                    .font(.system(size: 32, weight: .bold))
                Spacer()
                //MARK: - Privacy
                Button {
                    if let url = URL(string: "https://www.termsfeed.com/live/4b45eea3-b51f-4f6d-a7f8-62eac5233703") {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    AnswerCellView(text: "Privacy")
                        .frame(maxWidth: .infinity,maxHeight: 200)
                }
                
                //MARK: - Rate us button
                Button {
                    SKStoreReviewController.requestReview()
                } label: {
                    AnswerCellView(text: "RATE US")
                        .frame(maxWidth: .infinity,maxHeight: 200)
                }
                
                //MARK: - Show Result
                Button {
                    showResult.toggle()
                } label: {
                    AnswerCellView(text: "Result of the game")
                        .frame(maxWidth: .infinity,maxHeight: 200)
                }
                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $showResult) {
            ResultView()
        }
    }
} 

#Preview {
    SettingsView()
}
