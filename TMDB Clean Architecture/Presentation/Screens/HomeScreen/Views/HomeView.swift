//
//  HomeView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/20/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = Resolver.shared.resolve(HomeViewModel.self)
    
    var body: some View {
        ZStack {
            VStack {
                BaseStateView(viewModel: viewModel) {
                    List(viewModel.nowPlayingMovies) { movie in
                        Text(movie.title ?? "no title")
                    
                    .task {
                        await viewModel.loadMoreNowPlayingMovies(currentItem: movie)
                          }
                    }
                    .task {
                        await viewModel.loadNowPlayingMovies()
                    }
                } emptyView: {
                    
                } errorView: { error in
                }
            }

        }
    }
}

#Preview {
    HomeView()
}
