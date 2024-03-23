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
        

        BaseStateView(viewModel: viewModel, 
           successView: {
            ScrollView {
                if let movie = viewModel.singleMovie {
                    DetailImageView(movie: movie)
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
                await viewModel.loadMovieById(movieId: movieId)
            }
        }, emptyView: {
            EmptyPlaceholderView(text: "No movie", image: Image(systemName: "film"))
        }, errorView: { error in
            
        }, loadingView: {
            ProgressView()
        })
        
        }
    
    }
    
    


#Preview {
    NavigationStack {
        DetailView(movieId: 5)
    }
}


