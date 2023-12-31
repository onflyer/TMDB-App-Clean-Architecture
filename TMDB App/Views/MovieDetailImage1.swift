//
//  MovieDetailImage1.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/16/23.
//

import SwiftUI

struct MovieDetailImage1: View {
   
    let movie: SingleMovieResponse
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
            CachedImage(url: movie.backdropURLString) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                case .failure(_):
                    Image(systemName: "xmark")
                        .resizable()
                @unknown default:
                    EmptyView()
                }
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
    }
}

#Preview {
    MovieDetailImage1(movie: Movie.stubbedSingleMovieResponse)
}
