//
//  MovieDetailImage.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/19/23.
//

import SwiftUI

struct MovieDetailImage: View {
    let movie: SingleMovieResponse
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
            AsyncImage(url: movie.backdropURL) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
    }
}


#Preview {
    MovieDetailImage(movie: Movie.stubbedSingleMovieResponse)
}
