//
//  CachedImage.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/16/23.
//

import SwiftUI

struct CachedImage: View {
    @StateObject private var manager = CachedImageManager()
    
    let url: String
    
    var body: some View {
        ZStack {
            if let data = manager.data,
               let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
            }
        }
        .task {
            await manager.loadImage(url)
        }
    }
}

#Preview {
    CachedImage(url: Movie.stubbedMovie.posterURLString)
        
}
