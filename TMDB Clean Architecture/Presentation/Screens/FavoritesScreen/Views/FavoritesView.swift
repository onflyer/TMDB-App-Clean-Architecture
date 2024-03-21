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
        ZStack(content: {
            BaseStateView(viewModel: viewModel) {
                List(viewModel.favoriteMovies) { movie in
                    Text(movie.title ?? "novmovie")
                }
                .task {
                    await viewModel.loadFavoriteMovies()
                }
            } emptyView: {
                
            } errorView: { error in
                
            }

        })
    }
}

#Preview {
    FavoritesView()
}
