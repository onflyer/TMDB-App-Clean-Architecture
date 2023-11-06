//
//  ContentView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 10/21/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    func loadMovies() async {
        do {
            try await viewModel.fetchNowPlayingMovies()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
                
                Text("Now playing")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .top, spacing: 16) {
                        ForEach(viewModel.nowPlayingMovies) { movie in
                            MovieThumbnailPosterView(movie: movie)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
            }
        
        .task {
            await loadMovies()
    }
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
