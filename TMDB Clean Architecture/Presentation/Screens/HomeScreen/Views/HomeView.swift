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
                LazyVStack {
                    nowPlayingSection
                    upcomingSection
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
               CarouselPosterProgressView()
            }, errorView: { error in

            }) {
            }
        }
    }
    
    var upcomingSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Upcoming")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            BaseStateView(viewModel: viewModel, successView: {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .top, spacing: 16) {
                        ForEach(viewModel.upcomingMovies) { movie in
                            NavigationLink(destination: DetailView(movieId: movie.id ?? 0), label: {
                                ThumbnailBackdropView(movie: movie)
                            })
                            .task {
                                await viewModel.loadMoreUpcomingMovies(currentItem: movie)
                            }
                            .foregroundStyle(.primary)
                            
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    
                }
                .task {
                    await viewModel.loadUpcomingMovies()
                }
            }, emptyView: {
               CarouselBackdropProgressView()
            }, errorView: { error in
                
            }) {
            }
        }
    }
}



#Preview {
    HomeView()
}



