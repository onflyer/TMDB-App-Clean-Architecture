//
//  FavoriteMoviesViewModel.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/23/23.
//

import Foundation

@MainActor
class FavoriteMoviesViewModel: ObservableObject {
    
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func postToFavorites(movieId: Int) async throws {
        let data = FavoriteRequestDTO(mediaID: movieId)
        
        
    }
    
}
