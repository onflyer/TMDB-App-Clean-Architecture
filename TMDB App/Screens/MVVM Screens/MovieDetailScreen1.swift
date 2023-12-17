//
//  MovieDetailScreen1.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/17/23.
//

import SwiftUI

struct MovieDetailScreen1: View {
    
    @StateObject var viewModel = MovieDetailScreenViewModel(httpClient: HTTPClient())
    let movieId: Int
    
    
    var body: some View {
        ScrollView {
                if let movie = viewModel.movie {
                    MovieDetailImage1(movie: movie)
                        .padding(.bottom)
                    MovieDetailTrailersSection(movie: movie)
                        .padding(.horizontal)
                    MovieDescriptionSection(movie: movie)
                        .padding(.horizontal)
                    Divider()
                        .padding(.horizontal)
                    MovieCastSection(movie: movie)
                        .navigationTitle(movie.title)
                        
                }
        }
        .overlay{
            if viewModel.isLoading {
                ZStack(content: {
                    Color(uiColor: .systemBackground)
                    ProgressView()
                })
                
            }
        }
        .task {
            await viewModel.loadMoviebyId(movieId: movieId)
        }
        .onDisappear {
            viewModel.movie = nil
        }
    }
}

#Preview {
    MovieDetailScreen1(movieId: Movie.stubbedSingleMovieResponse.id)
}
