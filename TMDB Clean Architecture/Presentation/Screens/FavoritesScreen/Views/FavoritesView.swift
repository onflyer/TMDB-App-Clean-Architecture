//
//  FavoritesView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/21/24.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject private var viewModel = Resolver.shared.resolve(FavoritesViewModel.self)
    
    var body: some View {
        NavigationStack {
            BaseStateView(viewModel: viewModel) {
                VStack {
                    List {
                        //MARK: CHANGED TO LOCAL
                        ForEach(viewModel.favoriteMovies) {
                            movie in
                            NavigationLink {
                                DetailView(movieId: movie.id ?? 0)
                            } label: {
                                SearchRowView(movie: movie)
                            
                            }
                        }
                        .onDelete(perform: { indexSet in
                            viewModel.swipeToDelete(at: indexSet)
                        })
                    }
                    .animation(.default, value: viewModel.favoriteMovies)
                    .listStyle(.plain)
                    
                }
                
            } emptyView: {
                
            } errorView: { error in
                
            } loadingView: {
                ZStack {
                    ProgressView()
                }
            }
            .navigationTitle("Favorites online")
            .toolbar {
                EditButton().bold()
            }
            .task {
                await viewModel.loadFavoriteMovies()
            }
            .refreshable {
                await viewModel.loadFavoriteMovies()
            }
        }
    }
}

#Preview {
    FavoritesView()
}
