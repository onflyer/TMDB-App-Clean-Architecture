//
//  CarouselProgressViewswift.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/8/23.
//

import SwiftUI

struct CarouselPosterProgressView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 16) {
                ForEach(0..<4) { placeholder in
                    
                    ZStack {
                        ShimmerEffectBox()
                    }
                    .frame(width: 204, height: 306)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
    }
}

#Preview {
    CarouselPosterProgressView()
}
