//
//  MovieBackdropCarouselView1.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/16/23.
//

import SwiftUI

struct MovieThumbnailBackdropView1: View {
    
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                Color.gray.opacity(0.3)
                Text(movie.title)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .lineLimit(4)
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
            .cornerRadius(8)
            .shadow(radius: 4)
            
            Text(movie.title)
                .font(.headline)
                .lineLimit(1)
        }
        .aspectRatio(16/9, contentMode: .fit)
        .frame(height: 160)
    }
}

#Preview {
    MovieThumbnailBackdropView1(movie: Movie.stubbedMovie)
}
