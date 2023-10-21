//
//  ImageView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 10/21/23.
//

import SwiftUI

struct ImageView: View {
   
    let movie: Movie
    
    var body: some View {
        AsyncImage(url: movie.posterURL) { image in
            image.resizable()
                .scaledToFit()
        } placeholder: {
            Image(systemName: "heart")
        }

    }
}

//#Preview {
//    ImageView(movie: <#Movie#>)
//}
