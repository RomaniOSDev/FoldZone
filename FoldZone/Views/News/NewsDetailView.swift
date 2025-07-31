import SwiftUI

struct NewsDetailView: View {
    let article: Article

    var body: some View {
        ZStack {
            Image(.mainBack)
                .resizable()
                .ignoresSafeArea()
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                if let urlToImage = article.urlToImage, let imageUrl = URL(string: urlToImage) {
                    AsyncImage(url: imageUrl) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                }
                if let desc = article.description {
                    Text(desc)
                        .font(.body)
                        .foregroundStyle(.white)
                }
                Text("Source: \(article.source?.name ?? "Unknown")")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("Date: \(article.publishedAt?.prefix(10) ?? "")")
                    .font(.caption2)
                    .foregroundColor(.gray)
                if let url = URL(string: article.url) {
                    Link("Read full article", destination: url)
                        .font(.headline)
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
        }
        .navigationTitle("News")
        .navigationBarTitleDisplayMode(.inline)
    }
} 
