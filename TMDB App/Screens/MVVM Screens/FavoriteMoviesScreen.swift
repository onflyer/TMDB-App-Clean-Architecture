//
//  FavoriteMoviesScreen.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/23/23.
//

import SwiftUI

struct FavoriteMoviesScreen: View {
    
    @StateObject var viewModel = FavoriteMoviesViewModel(httpClient: HTTPClient())
    
    var body: some View {
        NavigationStack {
            MovieSearchListView(movies: viewModel.favoriteMovies)
                .navigationTitle("Favorite movies")
        }
        .refreshable {
            await viewModel.loadFavoriteMovies()
        }
        .task {
            await viewModel.loadFavoriteMovies()
        }
    }
}

#Preview {
    FavoriteMoviesScreen()
}
