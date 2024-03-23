//
//  DescrtiptionSection.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/23/24.
//

import SwiftUI

struct DescrtiptionSection: View {
    
    let movie: SingleMovieEntity
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Genre:")
                ForEach(movie.genres ?? []) { genre in
                    Text(genre.name ?? "N/A")
                }
            }
            .font(.headline)
            Text("Release date: \(movie.releaseDate ?? "N/A")")
                .font(.headline)
            Text("Duration: \(movie.durationText ?? "N/A")")
                .font(.headline)
            Text(movie.overview ?? "N/A")
                .padding(.vertical, 1)
            HStack {
                Text(movie.ratingtext ?? "N/A")
                    .foregroundStyle(.yellow)
                Text(movie.scoreText ?? "N/A")
            }
        }
    }
}

#Preview {
    DescrtiptionSection(movie: SingleMovieEntity.dummySingleMovie())
}


//struct MovieDescriptionSection: View {
//    let movie: SingleMovieResponse
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            HStack {
//                Text("Genre:")
//                ForEach(movie.genres) { genre in
//                    Text(genre.name)
//                }
//            }
//            .font(.headline)

//        }
//    }
//}
