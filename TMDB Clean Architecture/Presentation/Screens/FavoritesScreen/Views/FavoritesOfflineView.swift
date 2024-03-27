//
//  FavoritesOfflineView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/27/24.
//

import SwiftUI

struct FavoritesOfflineView: View {
    @StateObject private var viewModel = Resolver.shared.resolve(FavoritesViewModel.self)
    
    var body: some View {
        NavigationStack {
            BaseStateView(viewModel: viewModel) {
                VStack {
                    List {
                        //MARK: CHANGED TO LOCAL
                        ForEach(viewModel.coreDataFavorites) {
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
            .navigationTitle("Favorites offline")
            .toolbar {
                EditButton().bold()
            }
            .task {
                 viewModel.loadFavoritesFromCoreData()
            }
            .refreshable {
                 viewModel.loadFavoritesFromCoreData()
            }
        }
    }
}

#Preview {
    FavoritesOfflineView()
}
