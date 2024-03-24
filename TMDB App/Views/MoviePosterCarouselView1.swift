////
////  MoviePosterCarouselView1.swift
////  TMDB App
////
////  Created by Aleksandar Milidrag on 12/16/23.
////
//
//import SwiftUI
//
//struct MoviePosterCarouselView1: View {
//    
//    let title: String
//    let movie: [Movie]
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 16) {
//            
//            Text(title)
//                .font(.title)
//                .fontWeight(.bold)
//                .padding(.horizontal)
//            
//            ScrollView(.horizontal, showsIndicators: false) {
//                LazyHStack(alignment: .top, spacing: 16) {
//                    ForEach(movie) { movie in
//                        NavigationLink(destination: MovieDetailScreen1(movieId: movie.id)) {
//                            MovieThumbnailPosterView1(movie: movie)
//                        }
//                        
//                                
//                            
//                        }
//                    }
//                    .padding(.horizontal)
//                    .padding(.vertical, 8)
//                    
//                    
//                }
//            }
//        }
//    }
//
//
//#Preview {
//    MoviePosterCarouselView1(title: "Preview Title", movie: Movie.stubbedMovies)
//}
