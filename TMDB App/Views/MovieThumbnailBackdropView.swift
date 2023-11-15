//
//  MovieThumbnailBackdropView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/12/23.
//

import SwiftUI

struct MovieThumbnailBackdropView: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                Color.gray.opacity(0.3)
                Text(movie.title)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .lineLimit(4)
                CachedAsyncImage(url: movie.backdropURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .layoutPriority(-1)
                } placeholder: {
                    ProgressView()
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

//#Preview {
//    MovieThumbnailBackdropView()
//}
