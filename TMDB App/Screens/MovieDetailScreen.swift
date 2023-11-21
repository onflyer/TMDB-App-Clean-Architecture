//
//  MovieDetailScreen.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/21/23.
//

import SwiftUI

struct MovieDetailScreen: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    let movie: SingleMovieResponse
    
    var body: some View {
        NavigationStack {
            ScrollView {
                MovieDetailImage(movie: movie)
                    .padding(.bottom)
                MovieDetailTrailersSection(movie: movie)
                    .padding(.horizontal)
                MovieDescriptionSection(movie: movie)
                    .padding(.horizontal)
                Divider()
                    .padding(.horizontal)
                MovieCastSection(movie: movie)
            }
            .navigationTitle(movie.title)
        }
        
    }
}

#Preview {
    MovieDetailScreen(movie: Movie.stubbedSingleMovieResponse)
}
