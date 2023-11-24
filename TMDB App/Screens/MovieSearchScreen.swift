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
       
            MovieSearchListView(movies: viewModel.searchedMovies)
                
                .searchable(text: $viewModel.query, prompt: "Search movies")
                .task {
                    viewModel.addSubscribers()
                }
        }
    }


#Preview {
    NavigationStack {
        MovieSearchScreen()
            .environmentObject(ViewModel(httpClient: HTTPClient()))
    }
    
}
