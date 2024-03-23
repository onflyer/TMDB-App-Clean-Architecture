//
//  SearchView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/21/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = Resolver.shared.resolve(SearchViewModel.self)
    
    var body: some View {
        NavigationStack {
           
                BaseStateView(viewModel: viewModel) {
                    List {
                        ForEach(viewModel.searchedMovies) { movie in
                            NavigationLink {
                                DetailView(movieId: movie.id ?? 0)
                            } label: {
                                SearchRowView(movie: movie)
                            }
                            
                        }
                        
                    }
                    
                    
                    .navigationTitle("Search")
                    .searchable(text: $viewModel.query, prompt: "Search movies")
                    .onChange(of: viewModel.query, perform: { value in
                        Task {
                            await viewModel.loadSearchedMovies()
                        }
                    })
                    .listStyle(.plain)
                } emptyView: {
                    EmptyPlaceholderView(text: "Search your favourite movie", image: Image(systemName: "magnifyingglass"))
                } errorView: { error in
                    
                } loadingView: {
                    ZStack(content: {
                        Color(uiColor: .systemBackground)
                      ProgressView("Searching for movies")
                    })
                }
            
        }
    }
}

#Preview {
    SearchView()
    
}

//struct MovieSearchListView: View {
//    
//    let movies: [Movie]
//    
//    var body: some View {
//        VStack {
//            List {
//                ForEach(movies) { movie in
//                        NavigationLink(destination: MovieDetailScreen1(movieId: movie.id)) {
//                            MovieSearchRowView(movie: movie)
//                        
//                    }
//
//                }
//            }
//            .listStyle(.plain)
//        }
//    }
//}
