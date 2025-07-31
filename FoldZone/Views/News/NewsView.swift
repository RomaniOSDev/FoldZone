import SwiftUI

struct NewsView: View {
    @StateObject private var viewModel = NewsViewModel()
    
    init(){
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = navBarAppearance
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(.mainBack)
                    .resizable()
                    .ignoresSafeArea()
                
                    if viewModel.isLoading {
                        ProgressView("Loading news...")
                            .foregroundStyle(.white)
                    } else if let error = viewModel.error {
                        VStack(spacing: 12) {
                            Text("Error: \(error)").foregroundColor(.red)
                            Text("Try again later or check your API key/internet connection.")
                        }
                        .foregroundStyle(.white)
                    } else {
                        VStack{
                        ScrollView() {
                                ForEach(viewModel.articles) { article in
                                    NavigationLink(destination: NewsDetailView(article: article)) {
                                        CellForNewsView(news: article)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                
               
            }
            .navigationTitle("News")
            .onAppear {
                viewModel.fetchNews()
            }
        }
    }
}

#Preview {
    NewsView()
}
