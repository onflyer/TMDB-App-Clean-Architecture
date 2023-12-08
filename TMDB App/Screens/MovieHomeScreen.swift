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
                VStack {
                    if viewModel.isLoading {
                       CarouselPosterProgressView()
                    } else {
                        MoviePosterCarouselView(title: "Now Playing", movie: viewModel.nowPlayingMovies)
                    }
                    
                    MovieBackdropCarouselView(title: "Upcoming", movie: viewModel.upcomingMovies)
                    
                    MovieBackdropCarouselView(title: "Top Rated", movie: viewModel.topRatedMovies)
                    
                    MovieBackdropCarouselView(title: "Popular", movie: viewModel.popularMovies)
                }
            }
            .scrollIndicators(.hidden)
            .task {
                await loadNowPlayingMovies()
                await loadUpcomingMovies()
                await loadTopRatedMovies()
                await loadPopularMovies()
            }
            .navigationTitle("TMDB App")
            .alert(viewModel.alert?.title ?? "Error", isPresented: Binding(projectedValue: $viewModel.showAlert)) {
                viewModel.alert?.getButtonsForAlert
            } message: {
                if let subtitle = viewModel.alert?.subtitle {
                    Text(subtitle)
                }
            }

            
        }
    }
    
    func loadNowPlayingMovies() async {
        viewModel.isLoading = true
       
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
        viewModel.isLoading = false
        
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
