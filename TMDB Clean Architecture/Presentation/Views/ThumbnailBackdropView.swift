//
//  ThumbnailBackdropView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/21/24.
//

import SwiftUI

struct ThumbnailBackdropView: View {
    
    let movie: MovieEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                Color.gray.opacity(0.5)
                
                if let backdropPath = movie.backdropPath {
                        
                    CachedImage(url: backdropPath,animation: .easeOut.speed(3.0), transition: .opacity) { phase in
                        switch phase {
                        case .empty:
                            Color.gray.opacity(0.5)
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
            .cornerRadius(8)
            .shadow(radius: 4)
            
            Text(movie.title ?? "N/A")
            .font(.headline)
            .lineLimit(1)
        }
        .aspectRatio(16/9, contentMode: .fit)
        .frame(height: 160)
    }
}

#Preview {
    ThumbnailBackdropView(movie: MovieEntity.dummyMovie())
}
//struct MovieThumbnailBackdropView1: View {
//    
//    let movie: Movie
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            ZStack {
//                Color.gray.opacity(0.3)
//                Text(movie.title)
//                    .multilineTextAlignment(.center)
//                    .padding(.horizontal)
//                    .lineLimit(4)
//                CachedImage(url: movie.backdropURLString) { phase in
//                    switch phase {
//                    case .empty:
//                        ProgressView()
//                    case .success(let image):
//                        image
//                            .resizable()
//                    case .failure(_):
//                        Image(systemName: "xmark")
//                            .resizable()
//                    @unknown default:
//                        EmptyView()
//                    }
//                }
//
//            }
//            .cornerRadius(8)
//            .shadow(radius: 4)
//            
//            Text(movie.title)
//                .font(.headline)
//                .lineLimit(1)
//        }
//        .aspectRatio(16/9, contentMode: .fit)
//        .frame(height: 160)
//       
//    }
//}
