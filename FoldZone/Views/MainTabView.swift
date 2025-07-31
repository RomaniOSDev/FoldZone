import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
            RulesView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Rules")
                }
            QuizTabView()
                .tabItem {
                    Image(systemName: "questionmark.circle")
                    Text("Quiz")
                }
            InfoView()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("Info")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

#Preview {
    MainTabView()
} 
