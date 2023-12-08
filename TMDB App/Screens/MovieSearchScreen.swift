//
//  MovieSearchScreen.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/6/23.
//

import SwiftUI

struct MovieSearchScreen: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        NavigationStack {
            MovieSearchListView(movies: viewModel.searchedMovies)
                .onChange(of: viewModel.query, perform: { value in
                    Task {
                        try await viewModel.search(query:value)
                    }
                })
                .searchable(text: $viewModel.query, prompt: "Search movies")
                .navigationTitle("Search")
                .overlay {
                    if viewModel.searchedMovies.isEmpty {
                        EmptyPlaceholderView(text: "Search your favourite movie", image: Image(systemName: "magnifyingglass"))
                    }
                    if viewModel.isLoading {
                        ZStack(content: {
                            Color(uiColor: .systemBackground)
                          ProgressView("Searching for movies")
                        })
                        
                    }
                }
        }
    }
}




#Preview {
    NavigationStack {
        MovieSearchScreen()
            .environmentObject(ViewModel(httpClient: HTTPClient()))
    }
    
}
