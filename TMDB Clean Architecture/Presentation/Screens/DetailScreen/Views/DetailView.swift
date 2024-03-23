//
//  DetailView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/21/24.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel = Resolver.shared.resolve(DetailViewModel.self)
    
    let movieId: Int
    
    var body: some View {
        
            BaseStateView(viewModel: viewModel) {
                if viewModel.singleMovie != nil {
                    VStack {
                        Text(viewModel.singleMovie?.title ?? "no movie")
                    }
                    
                }
                    
                
            } emptyView: {
                
            } errorView: { error in
                
            } loadingView: {
                
            }

        
        .task {
            await viewModel.loadMovieById(movieId: movieId)
        }
    }
    
    
    var trailersSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Trailers")
                .font(.headline)
            VStack(spacing: 14) {
                ForEach(viewModel.singleMovie?.videos?.results ?? []) { trailer in
                    Link(destination: trailer.youtubeURL!, label: {
                        HStack {
                            Text(trailer.name ?? "N/A")
                                .multilineTextAlignment(.leading)
                            Spacer()
                            Image(systemName: "play.circle.fill")
                                .foregroundStyle(Color(uiColor: .systemBlue))
                        }
                    })
                    .foregroundStyle(.primary)
                    Divider()
                }
            }
        }
    }
    
    
}

#Preview {
    DetailView(movieId: 3)
}


