//
//  ImageViewResizable.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 10/25/23.
//

import SwiftUI

struct ImageViewResizable: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image(systemName: "doc.text.image").resizable()
    }
}

#Preview {
    ImageViewResizable()
        .previewLayout(.sizeThatFits)
        .frame(width: 200, height: 200)
}
