//
//  PostMovieToFavoritesUseCase.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/17/24.
//

import Foundation

protocol PostMovieToFavoritesUseCase {
    func execute(mediaId: Int) async throws
}

class PostMovieToFavoriteUseCaseImpl: PostMovieToFavoritesUseCase {
    private let repository: FavoritesRepository
    
    init(repository: FavoritesRepository) {
        self.repository = repository
    }
    
    func execute(mediaId: Int) async throws {
        try await repository.postMovieToFavorites(mediaId: mediaId)
    }
}


