//
//  MovieSearchScreen1.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/17/23.
//

import SwiftUI

struct MovieSearchScreen1: View {
    
    @StateObject var viewModel = MovieSearchScreenViewModel()
    
    var body: some View {
        
        NavigationStack {
           
                MovieSearchListView(movies: viewModel.searchedMovies1)
            
                .onChange(of: viewModel.query, perform: { value in
                    Task {
                        try await viewModel.fetchSearchedMovie(query:value)
                    }
                })
                .searchable(text: $viewModel.query, prompt: "Search movies")
                .navigationTitle("Search")
                .overlay {
                    if viewModel.searchedMovies1.isEmpty {
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
    MovieSearchScreen1()
}
