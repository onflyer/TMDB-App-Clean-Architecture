//
//  CachedImageManager.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/16/23.
//

import Foundation

final class CachedImageManager: ObservableObject {
    
    private let imageRetriever = ImageRetriever()
    
    @Published private (set) var data: Data?
    
    
    
    @MainActor
    func loadImage(_ imgUrl: String) async {
        do {
            self.data = try await imageRetriever.fetch(imgUrl)
        } catch {
            print(error)
        }
    }
    
}
