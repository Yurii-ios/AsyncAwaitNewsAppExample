import SwiftUI

struct ContentView: View {
    @StateObject private var newsSourceListViewModel = NewsSourceListViewModel()
    
    var body: some View {
        
        NavigationView {
        
        List(newsSourceListViewModel.newsSources, id: \.id) { newsSource in
            NavigationLink(destination: NewsListScreen(newsSource: newsSource)) {
                NewsSourceCell(newsSource: newsSource)
            }
        }
        .listStyle(.plain)
        .onAppear {
            newsSourceListViewModel.getSources()
        }
        .navigationTitle("News Sources")
        .navigationBarItems(trailing: Button(action: {
            // refresh the news
        }, label: {
            Image(systemName: "arrow.clockwise.circle")
        }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
