//
//  URLImage.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 10/25/23.
//

import SwiftUI

struct URLImage: View {
    @EnvironmentObject var viewModel: ViewModel
    
    let urlString: String
    
    var body: some View {
        ImageViewResizable(image: viewModel.image)
    }
}

#Preview {
    URLImage(urlString: "https://image.tmdb.org/t/p/w500/dfS5qHWFuXyZQnwYREwb7N4qU5p.jpg)")
        .environmentObject(ViewModel())
}
