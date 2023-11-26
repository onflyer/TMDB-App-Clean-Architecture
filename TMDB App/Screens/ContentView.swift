//
//  ContentView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 10/21/23.
//

import SwiftUI

struct ContentView: View {
    
    
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
        ScrollView {
            VStack {
                
                MoviePosterCarouselView(title: "Now Playing", movie: viewModel.nowPlayingMovies)
                
                MovieBackdropCarouselView(title: "Upcoming", movie: viewModel.upcomingMovies)
                
                MovieBackdropCarouselView(title: "Top Rated", movie: viewModel.topRatedMovies)
                
                MovieBackdropCarouselView(title: "Popular", movie: viewModel.popularMovies)
            }
        }
        
        .task {
            async let nowPlayingMovies: Void = loadNowPlayingMovies()
            async let upcomingMovies: Void = loadUpcomingMovies()
            async let topRatedMovies: Void = loadTopRatedMovies()
            async let popularMovies: Void = loadPopularMovies()
            
            let (_, _, _, _) = await (nowPlayingMovies, upcomingMovies, topRatedMovies, popularMovies)
            
        }
        
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel(httpClient: HTTPClient()))
}

