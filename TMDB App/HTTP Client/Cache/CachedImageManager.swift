//
//  CachedImageManager.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/16/23.
//

import Foundation

final class CachedImageManager: ObservableObject {
    
    let imageRetriever: ImageRetriever
    
    @Published private (set) var data: Data?
    
    init(imageRetriever: ImageRetriever) {
        self.imageRetriever = imageRetriever
    }
    
    @MainActor
    func loadImage(_ imgUrl: String) async {
        do {
            self.data = try await imageRetriever.fetch(imgUrl)
        } catch {
            print(error)
        }
    }
    
}
