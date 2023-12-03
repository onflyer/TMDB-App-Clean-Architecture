//
//  MovieHomeScreen.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/6/23.
//

import SwiftUI

struct MovieHomeScreen: View {
    @EnvironmentObject var viewModel: ViewModel
    
    func loadNowPlayingMovies() async {
        do {
            try await viewModel.fetchNowPlayingMovies()
        } catch {
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
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                    VStack {
                        
                        MoviePosterCarouselView(title: "Now Playing", movie: viewModel.nowPlayingMovies)
                        
                        MovieBackdropCarouselView(title: "Upcoming", movie: viewModel.upcomingMovies)
                        
                        MovieBackdropCarouselView(title: "Top Rated", movie: viewModel.topRatedMovies)
                        
                        MovieBackdropCarouselView(title: "Popular", movie: viewModel.popularMovies)
                    }
                }
                
                .task {
                    await loadNowPlayingMovies()
                    await loadUpcomingMovies()
                    await loadTopRatedMovies()
                    await loadPopularMovies()
                    
                    
            }
            .navigationTitle("TMDB App")
        }
        }
        
    }


#Preview {
    NavigationStack {
        MovieHomeScreen()
            .environmentObject(ViewModel(httpClient: HTTPClient()))
    }
}
