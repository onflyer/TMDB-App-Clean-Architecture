//
//  MovieThumnailPosterView1.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/16/23.
//

import SwiftUI

struct MovieThumbnailPosterView1: View {
    
    let movie: Movie
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
            Text(movie.title)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .lineLimit(4)
            
            CachedImage(url: movie.posterURLString) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                case .failure(_):
                    Text("Failed to download image")
                @unknown default:
                    EmptyView()
                }
                
            }
            
            
        }
        .frame(width: 204, height: 306)
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

#Preview {
    MovieThumbnailPosterView1(movie: Movie.stubbedMovie)
}
