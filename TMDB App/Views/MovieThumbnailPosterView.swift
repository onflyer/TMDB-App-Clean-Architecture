//
//  MovieThumbnailPosterView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 10/25/23.
//

import SwiftUI

struct MovieThumbnailPosterView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    let urlString: String
    
    var body: some View {
        ImageViewResizable(image: viewModel.image)
    }
}

#Preview {
    MovieThumbnailPosterView(urlString: "Preview")
        .environmentObject(ViewModel())
}
