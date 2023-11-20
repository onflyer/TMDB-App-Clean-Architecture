//
//  MovieDetailTrailersSection.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/19/23.
//

import SwiftUI

struct MovieDetailTrailersSection: View {
    
    let movie: SingleMovieResponse
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Trailers")
                .font(.headline)
                .padding(.horizontal, 20)
            List {
                ForEach(movie.videos.results) { trailer in
                    Link(destination: trailer.youtubeURL!, label: {
                        HStack {
                            Text(trailer.name)
                            Spacer()
                            Image(systemName: "play.circle.fill")
                                .foregroundColor(Color(UIColor.systemBlue))
                        }
                    })
                    
                }
            }
            .listStyle(.plain)
            
        }
            

        }
    }


#Preview {
    MovieDetailTrailersSection(movie: Movie.stubbedSingleMovieResponse)
}
