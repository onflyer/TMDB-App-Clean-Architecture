//
//  DetailImageView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/21/24.
//

import SwiftUI

struct DetailImageView: View {
    
    let movie: SingleMovieEntity
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
            
            if let backdropPath = movie.backdropPath {
                CachedImage(url: backdropPath) { phase in
                    switch phase {
                    case .empty:
                        Color.gray.opacity(0.3)
                    case .success(let image):
                        image.resizable()
                    case .failure(let error):
                        Text(error.localizedDescription)
                        
                    @unknown default:
                        EmptyView()
                    }
                }
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
    }
}

#Preview {
    DetailImageView(movie: SingleMovieEntity.dummySingleMovie())
}


