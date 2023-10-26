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
        VStack {
            List {
                ForEach(viewModel.nowPlayingMovies) { movie in
                    HStack {
                        Text(movie.title)
                        CachedAsyncImage(url: movie.posterURL) { image in
                            image.resizable()
                        } placeholder: {
                            Image(systemName: "doc.text.image")
                        }

                    }
                   
                    
                }
            }
            .task {
                await loadMovies()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
