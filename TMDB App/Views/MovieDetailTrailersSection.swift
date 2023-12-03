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
        VStack(alignment: .leading, spacing: 10) {
            Text("Trailers")
                .font(.headline)
            
            VStack(spacing: 14) {
                ForEach(movie.videos.results) { trailer in
                        Link(destination: trailer.youtubeURL!, label: {
                            HStack {
                                Text(trailer.name)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                                Image(systemName: "play.circle.fill")
                                    .foregroundColor(Color(UIColor.systemBlue))
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
    MovieDetailTrailersSection(movie: Movie.stubbedSingleMovieResponse)
}
