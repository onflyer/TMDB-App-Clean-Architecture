//
//  MovieHomeScreen1.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/17/23.
//

import SwiftUI

struct MovieHomeScreen1: View {
    
    @StateObject var viewModel = MovieHomeScreenViewModel(httpClient: HTTPClient())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    if viewModel.nowPlayingMovies1.isEmpty {
                        CarouselPosterProgressView()
                    } else {
                        MoviePosterCarouselView1(title: "Now Playing", movie: viewModel.nowPlayingMovies1)
                    }

                    if viewModel.upcomingMovies1.isEmpty {
                        CarouselPosterProgressView()
                    } else {
                        MovieBackdropCarouselView1(title: "Upcoming", movie: viewModel.upcomingMovies1)
                    }

                    if viewModel.topRatedMovies1.isEmpty {
                        CarouselPosterProgressView()
                    } else {
                        MovieBackdropCarouselView1(title: "Top Rated", movie: viewModel.topRatedMovies1)
                    }

                    if viewModel.popularMovies1.isEmpty {
                        CarouselPosterProgressView()
                    } else {
                        MovieBackdropCarouselView1(title: "Popular", movie: viewModel.popularMovies1)
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
        
        .alert(viewModel.alert?.title ?? "Error", isPresented: Binding(projectedValue: $viewModel.showAlert)) {
            viewModel.alert?.getButtonsForAlert
        } message: {
            if let subtitle = viewModel.alert?.subtitle {
                Text(subtitle)
            }
        }
        
    }
}

#Preview {
    MovieHomeScreen1()
}
