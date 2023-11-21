//
//  MovieDetailScreen.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/21/23.
//

import SwiftUI

struct MovieDetailScreen: View {
    
    let movieId: Int
 
    @EnvironmentObject var viewModel: ViewModel
    
    func loadMoviebyId() async {
        do {
            try await viewModel.fetchSingleMovie(movieId: movieId)
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if let movie = viewModel.movie {
                MovieDetailImage(movie: movie)
                    .padding(.bottom)
                MovieDetailTrailersSection(movie: movie)
                    .padding(.horizontal)
                MovieDescriptionSection(movie: movie)
                    .padding(.horizontal)
                Divider()
                    .padding(.horizontal)
                MovieCastSection(movie: movie)
                    .navigationTitle(movie.title)
            }
            }
            .task {
                await loadMoviebyId()
            }
        }
        
    }
}

#Preview {
    MovieDetailScreen(movieId: Movie.stubbedSingleMovieResponse.id)
        .environmentObject(ViewModel(httpClient: HTTPClient()))
}