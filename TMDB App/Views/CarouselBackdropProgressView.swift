//
//  CarouselBackdropProgressView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/8/23.
//

import SwiftUI

struct CarouselBackdropProgressView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 16) {
                    ForEach(0..<4) { placeholder in
                        VStack(alignment: .leading, spacing: 16) {
                            ZStack {
                                ShimmerEffectBox()
                            }
                            ShimmerEffectBox()
                                .frame(width: 204, height: 30)
                               
                        }
                        .aspectRatio(16/9, contentMode: .fit)
                        .frame(height: 160)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                        
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
              
            }
            
        }
    }
}

#Preview {
    CarouselBackdropProgressView()
}
