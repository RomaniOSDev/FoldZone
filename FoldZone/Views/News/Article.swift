import Foundation

struct Article: Identifiable, Decodable {
    let id = UUID()
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
    let source: Source?
    
    struct Source: Decodable {
        let name: String?
    }
    
    private enum CodingKeys: String, CodingKey {
        case title, description, url, urlToImage, publishedAt, source
    }
}

struct NewsResponse: Decodable {
    let articles: [Article]
} 