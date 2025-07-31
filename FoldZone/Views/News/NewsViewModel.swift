import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading = false
    @Published var error: String?
    
    private let apiKey = "3f44742c4abc42d9a6401da6a4335aa8"
    private let keywords = "poker OR card game OR casino OR tournament OR world series of poker OR wsop OR pokerstars OR blackjack OR cards OR online poker OR poker tournament"
    private let language = "en"
    private let sortBy = "publishedAt"
    
    func fetchNews() {
        isLoading = true
        error = nil

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let monthAgo = Calendar.current.date(byAdding: .month, value: -1, to: Date())!
        let fromDate = dateFormatter.string(from: monthAgo)

        let urlString = "https://newsapi.org/v2/everything?q=\(keywords)&from=\(fromDate)&language=\(language)&sortBy=\(sortBy)&apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else {
            self.error = "Invalid URL"
            self.isLoading = false
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    self.error = error.localizedDescription
                    return
                }
                guard let data = data else {
                    self.error = "No data"
                    return
                }
                do {
                    let news = try JSONDecoder().decode(NewsResponse.self, from: data)
                    self.articles = news.articles
                } catch {
                    self.error = "Parsing error: \(error.localizedDescription)"
                    if let raw = String(data: data, encoding: .utf8) {
                        print("RAW DATA: \(raw)")
                    }
                }
            }
        }.resume()
    }
} 
