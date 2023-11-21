//
//  MovieDesctriptionSection.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/20/23.
//

import SwiftUI

struct MovieDescriptionSection: View {
    let movie: SingleMovieResponse
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Genre:")
                ForEach(movie.genres) { genre in
                    Text(genre.name)
                }
            }
            .font(.headline)
            Text("Release date: \(movie.yearText)")
                .font(.headline)
            Text("Duration: \(movie.durationText)")
                .font(.headline)
            Text(movie.overview)
                .padding(.vertical, 1)
            HStack {
                Text(movie.ratingText)
                    .foregroundStyle(.yellow)
                Text(movie.scoreText)
            }
        }
    }
}


#Preview {
    MovieDescriptionSection(movie: Movie.stubbedSingleMovieResponse)
}
