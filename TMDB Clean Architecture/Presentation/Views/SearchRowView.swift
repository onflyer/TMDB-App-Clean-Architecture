//
//  SearchRowView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/21/24.
//

import SwiftUI

struct SearchRowView: View {
    let movie: MovieEntity
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            if let posterPath = movie.posterPath {
            CachedImage(url: posterPath) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 61, height: 92)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                case .failure(let error):
                    Text(error.localizedDescription)
                @unknown default:
                    EmptyView()
                }
            }
                VStack(alignment: .leading) {
                    Text(movie.title ?? "N/A")
                    .font(.headline)
                    
                    Text(movie.releaseDate ?? "N/A")
                    .font(.subheadline)
                    
                    Text(movie.ratingText ?? "N/A")
                    .foregroundColor(.yellow)
                }
          }
        }
    }
}

#Preview {
    SearchRowView(movie: MovieEntity.dummyMovie())
}

//struct MovieSearchRowView: View {
//    
//    let movie: Movie
//    
//    var body: some View {
//        
//        HStack(alignment: .top, spacing: 16) {
//            
//            CachedImage(url: movie.posterURLString) { phase in
//                switch phase {
//                case .empty:
//                    ProgressView()
//                case .success(let image):
//                    image
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 61, height: 92)
//                        .cornerRadius(8)
//                        .shadow(radius: 4)
//                case .failure(_):
//                    Image(systemName: "xmark")
//                        .resizable()
//                @unknown default:
//                    EmptyView()
//                }
//            }
//
//            
//            VStack(alignment: .leading) {
//                Text(movie.title)
//                    .font(.headline)
//                
//                Text(movie.yearText)
//                    .font(.subheadline)
//               
//                Text(movie.ratingText)
//                    .foregroundColor(.yellow)
//            }
//        }
//    }
//}
