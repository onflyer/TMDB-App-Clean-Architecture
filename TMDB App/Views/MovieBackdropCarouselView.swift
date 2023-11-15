//
//  MovieBackdropCarouselView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/15/23.
//

import SwiftUI

struct MovieBackdropCarouselView: View {
    
    let title: String
    let movie: [Movie]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 16) {
                    ForEach(movie) { movie in
                       MovieThumbnailBackdropView(movie: movie)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
        }
    }
}

//#Preview {
//    MovieBackdropCarouselView()
//}
