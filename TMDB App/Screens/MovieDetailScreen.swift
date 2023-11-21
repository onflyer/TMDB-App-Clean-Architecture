//
//  MovieDetailScreen.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/21/23.
//

import SwiftUI

struct MovieDetailScreen: View {
    let movie: SingleMovieResponse
   
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .navigationTitle(movie.title)
        }
    }
}

#Preview {
    MovieDetailScreen(movie: Movie.stubbedSingleMovieResponse)
}
