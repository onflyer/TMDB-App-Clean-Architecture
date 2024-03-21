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
        NavigationStack {
            ScrollView {
                VStack {
                    nowPlayingSection
                }
            }
            .navigationTitle("TMDB APP")
        }
        
    }
    
    var nowPlayingSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Now playing")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            BaseStateView(viewModel: viewModel, successView: {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .top, spacing: 16) {
                        ForEach(viewModel.nowPlayingMovies) { movie in
                            NavigationLink(destination: DetailView(movieId: movie.id ?? 0)) {
                                ThumbnailPosterView(movie: movie)
                            }
                            .task {
                                await viewModel.loadMoreNowPlayingMovies(currentItem: movie)
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
                .task {
                   await viewModel.loadNowPlayingMovies()
                }

            }, emptyView: {
                
            }, errorView: { error in

            }) {
            }
        }
    }
}



#Preview {
    HomeView()
}



