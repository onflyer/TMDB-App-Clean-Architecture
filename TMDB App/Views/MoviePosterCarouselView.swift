//
//  MoviePosterCarouselView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/6/23.
//

import SwiftUI

struct MoviePosterCarouselView: View {
   
    @EnvironmentObject var viewModel: ViewModel
   
    let title: String
    let movie: [Movie]
    
    func loadNextSetOfNowPlayingMovies() async {
        do {
            try await viewModel.fetchNextPageOfNowPlayingMovies()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 16) {
                    ForEach(movie) { movie in
                        NavigationLink(destination: MovieDetailScreen(movieId: movie.id)) {
                            MovieThumbnailPosterView(movie: movie)
                        }
                        .onAppear(perform: {
                            if self.movie.last?.id == movie.id {
                                Task {
                                    await loadNextSetOfNowPlayingMovies()
                                }
                            }
                        })
//                        NavigationLink(value: Route.detailView(movie), label: {
//                            MovieThumbnailPosterView(movie: movie)
//                        }) 
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                
              
            }
            
        }
    }
}
#Preview {
    MoviePosterCarouselView(title: "Preview Poster", movie: Movie.stubbedMovies)
        .environmentObject(ViewModel(httpClient: HTTPClient()))
        
}
