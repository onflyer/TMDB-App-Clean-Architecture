//
//  MovieThumbnailPosterView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/6/23.
//

import SwiftUI

struct MovieThumbnailPosterView: View {
    let movie: Movie
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
            Text(movie.title)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .lineLimit(4)
            CachedAsyncImage(url: movie.posterURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .layoutPriority(-1)
            } placeholder: {
                ProgressView()
            }

        }
        .frame(width: 204, height: 306)
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

#Preview {
    MovieThumbnailPosterView(movie: Movie.stubbedMovie)
}
