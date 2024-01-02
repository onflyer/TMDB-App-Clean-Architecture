//
//  MovieDetailScreen1.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/17/23.
//

import SwiftUI

struct MovieDetailScreen1: View {
    
    @StateObject var viewModel = MovieDetailScreenViewModel()
    let movieId: Int
    
    
    var body: some View {
        
            ScrollView {
                    if let movie = viewModel.movie {
                        MovieDetailImage1(movie: movie)
                            
                        favoriteButton
                
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
  
    private var favoriteButton: some View {
        Button(action: {
            
                if !viewModel.isFavorite {
                    Task {
                        await viewModel.loadPostToFavorites(movieId: movieId)
                        viewModel.isFavorite = true
                    }
                    
                } else {
                    Task {
                        await viewModel.loadDeleteFavoriteMovie(movieId:movieId)
                        viewModel.isFavorite = false
                    }
                   
                }
            
        }, label: {
            HStack(alignment: .firstTextBaseline, content: {
                Text(viewModel.isFavorite ? "Remove from favorites" : "Add to favorites")
                    .bold()
                    .animation(.default)
                Spacer()
                Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                    .animation(.default)
            })
            .padding(.horizontal)
            .padding(.vertical, 5)
        })

    }
}



#Preview {
    NavigationStack {
        MovieDetailScreen1(movieId: Movie.stubbedSingleMovieResponse.id)
    }
}
