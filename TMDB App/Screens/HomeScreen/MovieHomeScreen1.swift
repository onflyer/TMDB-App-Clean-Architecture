//
//  MovieHomeScreen1.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/17/23.
//

import SwiftUI

struct MovieHomeScreen1: View {
    
    @StateObject var viewModel = MovieHomeScreenViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    if viewModel.nowPlayingMovies1.isEmpty {
                        CarouselPosterProgressView()
                    } else {
                        nowPlayingSection
                    }

                    if viewModel.upcomingMovies1.isEmpty {
                        CarouselPosterProgressView()
                    } else {
                        upcomingSection
                    }

                    if viewModel.topRatedMovies1.isEmpty {
                        CarouselPosterProgressView()
                    } else {
                        topRatedSection
                    }

                    if viewModel.popularMovies1.isEmpty {
                        CarouselPosterProgressView()
                    } else {
                        popularSection
                    }

                }
            }
            
            .navigationTitle("TMDB App")
        }
        .scrollIndicators(.hidden)
        .task {
            await viewModel.loadNowPlayingMovies()
            await viewModel.loadUpcomingMovies()
            await viewModel.loadTopRatedMovies()
            await viewModel.loadPopularMovies()
        }

        .alert(isPresented: $viewModel.hasError, error: viewModel.error) { error in
            Text("Error: \(error.localizedDescription)")
            
            Button("Cancel", role: .cancel) {
                
            }
            
            Button("Retry") {
                Task {
                    await viewModel.loadNowPlayingMovies()
                }
            }
            
        } message: { messsage in
            Text("Message placeholder")
        }

        //MARK: ALERT place
        
    }
    
    var nowPlayingSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Now playing")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 16) {
                    ForEach(viewModel.nowPlayingMovies1) { movie in
                        NavigationLink(destination: MovieDetailScreen1(movieId: movie.id)) {
                            MovieThumbnailPosterView1(movie: movie)
                        }
                        .onAppear {
                            if viewModel.nowPlayingMovies1.last?.id == movie.id {
                                Task {
                                    await viewModel.loadNextSetOfNowPlayingMovies()
                                }
                            }
                        }
                    }
                    
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
        }
    }
    
    var upcomingSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Upcoming")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 16) {
                    ForEach(viewModel.upcomingMovies1) { movie in
                        NavigationLink(destination: MovieDetailScreen1(movieId: movie.id), label: {
                            MovieThumbnailBackdropView1(movie: movie)
                        })
                        .onAppear {
                            if viewModel.upcomingMovies1.last?.id == movie.id {
                                Task {
                                    await viewModel.loadNextSetOfUpcomingMovies()
                                }
                            }
                        }
                        .foregroundStyle(.primary)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                
            }
        }
    }
    
    var topRatedSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Top Rated")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 16) {
                    ForEach(viewModel.topRatedMovies1) { movie in
                        NavigationLink(destination: MovieDetailScreen1(movieId: movie.id), label: {
                            MovieThumbnailBackdropView1(movie: movie)
                        })
                        .onAppear {
                            if viewModel.topRatedMovies1.last?.id == movie.id {
                                Task {
                                    await viewModel.loadNextSetOfTopRatedMovies()
                                }
                            }
                        }
                        .foregroundStyle(.primary)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                
            }
        }
    }
    
    var popularSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Popular")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 16) {
                    ForEach(viewModel.popularMovies1) { movie in
                        NavigationLink(destination: MovieDetailScreen1(movieId: movie.id), label: {
                            MovieThumbnailBackdropView1(movie: movie)
                        })
                        .onAppear {
                            if viewModel.popularMovies1.last?.id == movie.id {
                                Task {
                                    await viewModel.loadNextSetOfPopularMovies()
                                }
                            }
                        }
                        .foregroundStyle(.primary)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                
            }
        }
    }
}

#Preview {
    MovieHomeScreen1()
}





