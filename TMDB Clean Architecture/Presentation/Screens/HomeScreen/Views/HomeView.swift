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
            ScrollView(showsIndicators: false) {
                
                        nowPlayingSection
                        upcomingSection
                        topRatedSection
                        popularSection
                    
                }
                .navigationTitle("TMDB APP")
                
            
        }
        
    }
    
    var nowPlayingSection: some View {
       
            BaseStateView(viewModel: viewModel, successView: {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Now playing")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
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
                }

            }, emptyView: {
               CarouselPosterProgressView()
            }, errorView: { error in

            }, loadingView: {
            })
        
    }
    
    var upcomingSection: some View {
       
            BaseStateView(viewModel: viewModel, successView: {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Upcoming")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
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
                }
            }, emptyView: {
               CarouselBackdropProgressView()
            }, errorView: { error in
                
            }, loadingView: {
            })
            
        
    }
    
    var topRatedSection: some View {
            BaseStateView(viewModel: viewModel, successView: {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Top rated")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .top, spacing: 16) {
                            ForEach(viewModel.topRatedMovies) { movie in
                                NavigationLink(destination: DetailView(movieId: movie.id ?? 0), label: {
                                    ThumbnailPosterView(movie: movie)
                                })
                                .task {
                                    await viewModel.loadMoreTopRatedMovies(currentItem: movie)
                                }
                                .foregroundStyle(.primary)
                                
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        
                    }
                    .task {
                        await viewModel.loadTopRatedMovies()
                }
                }
            }, emptyView: {
               CarouselPosterProgressView()
            }, errorView: { error in
                
            }, loadingView: {
            })
        
    }
    
    var popularSection: some View {
        
            BaseStateView(viewModel: viewModel, successView: {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Popular")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .top, spacing: 16) {
                            ForEach(viewModel.popularMovies) { movie in
                                NavigationLink(destination: DetailView(movieId: movie.id ?? 0), label: {
                                    ThumbnailBackdropView(movie: movie)
                                })
                                .task {
                                    await viewModel.loadMorePopularMovies(currentItem: movie)
                                }
                                .foregroundStyle(.primary)
                                
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        
                    }
                    .task {
                        await viewModel.loadPopularMovies()
                }
                }
            }, emptyView: {
               CarouselBackdropProgressView()
            }, errorView: { error in
                
            }, loadingView: {
                
            })
        
    }
}



#Preview {
    HomeView()
}



