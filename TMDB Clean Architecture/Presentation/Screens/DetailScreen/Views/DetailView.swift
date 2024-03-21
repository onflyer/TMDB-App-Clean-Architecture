//
//  DetailView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/21/24.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel = Resolver.shared.resolve(DetailViewModel.self)
    
    let movieId: Int
    
    var body: some View {
        ZStack {
            BaseStateView(viewModel: viewModel) {
                if viewModel.singleMovie != nil {
                    VStack {
                        Text(viewModel.singleMovie?.title ?? "no movie")
                    }
                    
                }
                    
                
            } emptyView: {
                
            } errorView: { error in
                
            }

        }
        .task {
            await viewModel.loadMovieById(movieId: 3)
        }
    }
}

#Preview {
    DetailView(movieId: 3)
}
