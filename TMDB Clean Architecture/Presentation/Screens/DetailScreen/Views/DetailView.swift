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
        

        ScrollView {
            if let movie = viewModel.singleMovie {
                DetailImageView(movie: movie)
                TrailersSection(movie: movie)
                DescrtiptionSection(movie: movie)
                CastSection(movie: movie)
                    .navigationTitle(movie.title ?? "N/A")
            }
               
        }
        .scrollIndicators(.hidden)
        .task {
            await viewModel.loadMovieById(movieId: movieId)
        }
    
    }
    
    
}

#Preview {
    NavigationStack {
        DetailView(movieId: 5)
    }
}


