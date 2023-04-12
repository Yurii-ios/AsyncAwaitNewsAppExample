import SwiftUI

struct NewsListScreen: View {
    
    let newsSource: NewsSourceViewModel
    @StateObject private var newsArticleListViewModel = NewsArticleListViewModel()
    
    var body: some View {
        List(newsArticleListViewModel.newsArticles, id: \.id) { newsArticle in
            NewsArticleCell(newsArticle: newsArticle)
        }
        .listStyle(.plain)
        .task {
            await newsArticleListViewModel.getNewsBy(sourceId: newsSource.id)
        }
        .navigationTitle(newsSource.name)
    }
}

struct NewsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsListScreen(newsSource: NewsSourceViewModel.default)
    }
}
