//
//  DetailView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/21/24.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel = Resolver.shared.resolve(DetailViewModel.self)
    @ObservedObject private var favoritesViewModel = Resolver.shared.resolve(FavoritesViewModel.self)
    @Environment(\.dismiss) var dismiss
    let movieId: Int
    
    var body: some View {
        BaseStateView(viewModel: viewModel,
                      successView: {
            ScrollView {
                if let movie = viewModel.singleMovie {
                    DetailImageView(movie: movie)
                    favoriteButton
                    favoriteButtonOffline
                    TrailersSection(movie: movie)
                        .padding(.horizontal)
                    DescrtiptionSection(movie: movie)
                        .padding(.horizontal)
                    Divider()
                        .padding(.horizontal)
                    CastSection(movie: movie)
                        .navigationTitle(movie.title ?? "N/A")
                }
            }
            .scrollIndicators(.hidden)
            .task {
                favoritesViewModel.isFavorite(movieId: movieId, posterPath: viewModel.singleMovie?.posterPath ?? "N/A" , coreDataTitle: viewModel.singleMovie?.title ?? "N/A")
                
                await viewModel.loadMovieById(movieId: movieId)
                await favoritesViewModel.loadFavoriteMovies()
            }
        },
                      emptyView: {
            EmptyPlaceholderView(text: "No movie", image: Image(systemName: "film"))
        }, errorView: { error in
            
        }, loadingView: {
            ProgressView()
        })
        
    }
    
    var favoriteButtonOffline: some View {
        Button(action: {
            if favoritesViewModel.isFavorite {
                favoritesViewModel.removeFromFavoritesOffline(movieId: movieId, posterPath: viewModel.singleMovie?.posterPath ?? "N/A" , coreDataTitle: viewModel.singleMovie?.title ?? "N/A")
            } else {
                Task {
                   await favoritesViewModel.addToFavoritesOffline(movieId: movieId, posterPath: viewModel.singleMovie?.posterPath ?? "N/A" , coreDataTitle: viewModel.singleMovie?.title ?? "N/A")
                }
                
            }
            favoritesViewModel.isFavorite.toggle()
            
        },
               label: {
            HStack(alignment: .firstTextBaseline, content: {
                Text(favoritesViewModel.isFavorite ? "Remove from favorites offline" : "Add to favorites offline")
                    .bold()
                    .animation(.default)
                Spacer()
                Image(systemName: favoritesViewModel.isFavorite ? "heart.fill" : "heart")
                    .animation(.default)
            })
            .padding(.horizontal)
            .padding(.vertical, 5)
            
        })
        
    }
    var favoriteButton: some View {
        Button(action: {
            Task {
                
                if await favoritesViewModel.movieIsFavorite(movieId: movieId) {
                    await favoritesViewModel.deleteFromFavorites(movieId: movieId)
                    dismiss()
                    await favoritesViewModel.loadFavoriteMovies()
                    
                } else {
                    await favoritesViewModel.addToFavorites(movieId: movieId)
                    await favoritesViewModel.loadFavoriteMovies()
                    
                }
                
            }
            
        }, label: {
            HStack(alignment: .firstTextBaseline, content: {
                Text(favoritesViewModel.favoriteMovies.contains(where: { favoriteMovie in
                    favoriteMovie.id == movieId
                }) ? "Remove from favorites online" : "Add to favorites online")
                .bold()
                .animation(.default)
                Spacer()
                Image(systemName: favoritesViewModel.favoriteMovies.contains(where: { favoriteMovie in
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
        DetailView(movieId: 5)
    }
}



