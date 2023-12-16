//
//  MovieSearchListView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/23/23.
//

import SwiftUI

struct MovieSearchListView: View {
    
    let movies: [Movie]
    
    var body: some View {
        VStack {
            List {
                ForEach(movies) { movie in
                        NavigationLink(destination: MovieDetailScreen(movieId: movie.id)) {
                            MovieSearchRowView(movie: movie)
                        
                    }

                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    NavigationStack {
        MovieSearchListView(movies: Movie.stubbedMovies)
    }
}
