//
//  MovieThumbnailView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/2/23.
//

import SwiftUI

struct MovieThumbnailView: View {
    let movie: Movie
    
    var body: some View {
        CachedAsyncImage(url: movie.posterURL) { image in
            image.resizable()
        } placeholder: {
            Image(systemName: "doc.text.image")
        }

    }
}

//#Preview {
//    MovieThumbnailView()
//}
