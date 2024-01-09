//
//  MovieDetailScreen1.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/17/23.
//

import SwiftUI

struct MovieDetailScreen1: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = MovieDetailScreenViewModel()
    let movieId: Int
    @StateObject var favoritesViewmodel = FavoriteMoviesViewModel()
    
    
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
                await favoritesViewmodel.loadFavoriteMovies()
            }
            .onDisappear {
                viewModel.movie = nil
        }
    }
  
    private var favoriteButton: some View {
        Button(action: {
            
            if !favoritesViewmodel.favoriteMovies.contains(where: { favotieMovie in
                favotieMovie.id == movieId
            }) {
                print("This movie is not favorite")
                
                    Task {
                        await viewModel.loadPostToFavorites(movieId: movieId)
                        await favoritesViewmodel.loadFavoriteMovies()
                    }
                    
                } else {
                    print("this movie is favorite")
                    Task {
                        await viewModel.loadDeleteFavoriteMovie(movieId:movieId)
                        dismiss()
                        await favoritesViewmodel.loadFavoriteMovies()
                    }
                   
                }
            
        }, label: {
            HStack(alignment: .firstTextBaseline, content: {
                Text(favoritesViewmodel.favoriteMovies.contains(where: { favoriteMovie in
                    favoriteMovie.id == movieId
                }) ? "Remove from favorites" : "Add to favorites")
                    .bold()
                    .animation(.default)
                Spacer()
                Image(systemName: favoritesViewmodel.favoriteMovies.contains(where: { favoriteMovie in
                    favoriteMovie.id == movieId
                }) ? "heart.fill" : "heart")
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
