//
//  ThumbnailPosterView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/21/24.
//

import SwiftUI

struct ThumbnailPosterView: View {
    
    let movie: MovieEntity
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5)
            if let posterPath = movie.posterPath {
                CachedImage(url: posterPath, animation: .easeOut.speed(3.0), transition: .opacity) { phase in
                    switch phase {
                    case .empty:
                        Color.gray.opacity(0.5)
                    case .success(let image):
                        image.resizable()
                    case .failure(let error):
                        ZStack {
                         Color.gray.opacity(0.5)
                            Text(error.localizedDescription)
                        }
                    @unknown default:
                        EmptyView()
                    }
                }
            }

        }
        .frame(width: 204, height: 306)
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

#Preview {
    ThumbnailPosterView(movie: MovieEntity.dummyMovie() )
}



