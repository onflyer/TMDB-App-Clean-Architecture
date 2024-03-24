//
//  TrailersSection.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/23/24.
//

import SwiftUI

struct TrailersSection: View {
    let movie: SingleMovieEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Trailers")
                .font(.headline)
            
            VStack(spacing: 14) {
                ForEach(movie.videos?.results ?? []) { trailer in
                        Link(destination: trailer.youtubeURL!, label: {
                            HStack {
                                Text(trailer.name ?? "N/A")
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
    TrailersSection(movie: SingleMovieEntity.dummySingleMovie())
}


