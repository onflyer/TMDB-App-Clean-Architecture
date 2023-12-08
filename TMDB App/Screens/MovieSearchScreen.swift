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
                        viewModel.isLoading = true
                        try await viewModel.search(query:value)
                        viewModel.isLoading = false
                    }
                })
                .searchable(text: $viewModel.query, prompt: "Search movies")
                .navigationTitle("Search")
                .overlay {
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
