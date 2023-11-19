//
//  MovieDetailImage.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/19/23.
//

import SwiftUI

struct MovieDetailImage: View {
    let movie: Movie
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
            CachedAsyncImage(url: movie.backdropURL) { image in
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
    MovieDetailImage(movie: Movie.stubbedMovie)
}
