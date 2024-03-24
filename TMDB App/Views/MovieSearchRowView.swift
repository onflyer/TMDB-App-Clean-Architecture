////
////  MovieSearchRowView.swift
////  TMDB App
////
////  Created by Aleksandar Milidrag on 11/23/23.
////
//
//import SwiftUI
//
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
//
//#Preview {
//    MovieSearchRowView(movie: Movie.stubbedMovie)
//    
//    
//}
