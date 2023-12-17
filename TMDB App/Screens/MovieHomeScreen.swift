//
//  MovieHomeScreen.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/6/23.
//

import SwiftUI

struct MovieHomeScreen: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    if viewModel.nowPlayingMovies.isEmpty {
                        CarouselPosterProgressView()
                    } else {
                        MoviePosterCarouselView1(title: "Now Playing", movie: viewModel.nowPlayingMovies)
                    }

                    if viewModel.upcomingMovies.isEmpty {
                        CarouselPosterProgressView()
                    } else {
                        MovieBackdropCarouselView1(title: "Upcoming", movie: viewModel.upcomingMovies)
                    }

                    if viewModel.topRatedMovies.isEmpty {
                        CarouselPosterProgressView()
                    } else {
                        MovieBackdropCarouselView1(title: "Top Rated", movie: viewModel.topRatedMovies)
                    }

                    if viewModel.popularMovies.isEmpty {
                        CarouselPosterProgressView()
                    } else {
                        MovieBackdropCarouselView1(title: "Popular", movie: viewModel.popularMovies)
                    }

                }
            }
            .navigationTitle("TMDB App")
        }
        .scrollIndicators(.hidden)
        .task {
            await loadNowPlayingMovies()
            await loadUpcomingMovies()
            await loadTopRatedMovies()
            await loadPopularMovies()
        }
        
        .alert(viewModel.alert?.title ?? "Error", isPresented: Binding(projectedValue: $viewModel.showAlert)) {
            viewModel.alert?.getButtonsForAlert
        } message: {
            if let subtitle = viewModel.alert?.subtitle {
                Text(subtitle)
            }
        }
        
    }
    
    
    func loadNowPlayingMovies() async {
        do {
            try await viewModel.fetchNowPlayingMovies()
        } catch {
            viewModel.showAlert = true
            viewModel.alert = .noInternetConnection(onOkPressed: {
                
            }, onRetryPressed: {
                Task {
                    try await viewModel.fetchNowPlayingMovies()
                }
            })
            print(error)
        }
        
        
    }
    
    func loadUpcomingMovies() async {
        
        do {
            try await viewModel.fetchUpcomingMovies()
        } catch {
            print(error)
        }
        
    }
    
    func loadTopRatedMovies() async {
        
        do {
            try await viewModel.fetchTopRatedMovies()
        } catch {
            print(error)
        }
        
    }
    
    func loadPopularMovies() async {
        
        do {
            try await viewModel.fetchPopularMovies()
        } catch {
            print(error)
        }
    }
}


#Preview {
    NavigationStack {
        MovieHomeScreen()
            .environmentObject(ViewModel(httpClient: HTTPClient()))
    }
}
