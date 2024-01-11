//
//  FavoriteMoviesScreen.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/23/23.
//

import SwiftUI

struct FavoriteMoviesScreen: View {
    
    @StateObject var viewModel = FavoriteMoviesViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.favoriteMovies) { movie in
                            NavigationLink(destination: MovieDetailScreen1(movieId: movie.id)) {
                                MovieSearchRowView(movie: movie)
                                    
                        }
                    }
                    .onDelete(perform: { indexSet in
                        viewModel.swipeToDelete(at: indexSet)
                    })
                }
                .animation(.default, value: viewModel.favoriteMovies)
                .listStyle(.plain)
            }
            .navigationTitle("Favorite movies")
            .toolbar {
                EditButton()
                    .bold()
            }
        }
        .refreshable {
            await viewModel.loadFavoriteMovies()
        }
        .task {
            await viewModel.loadFavoriteMovies()
        }
        .alert(isPresented: $viewModel.hasError, error: viewModel.error) { error in
            Text("Error: \(error.localizedDescription)")
            
            Button("Cancel", role: .cancel) {
                
            }
            
            Button("Retry") {
                Task {
                    await viewModel.loadFavoriteMovies()
                }
            }
            
        } message: { messsage in
            Text("Message placeholder")
        }
    }
}

#Preview {
    FavoriteMoviesScreen()
}
