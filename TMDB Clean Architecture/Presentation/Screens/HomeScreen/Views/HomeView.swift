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
            BaseStateView(viewModel: viewModel) {
                List(viewModel.popularMovies) { movie in
                    Text(movie.title ?? "no title")
                    
                }
                .task {
                    await viewModel.loadPopularMovies()
                }
            } emptyView: {
                
            } errorView: { error in
                
            }

        }
    }
}

#Preview {
    HomeView()
}
