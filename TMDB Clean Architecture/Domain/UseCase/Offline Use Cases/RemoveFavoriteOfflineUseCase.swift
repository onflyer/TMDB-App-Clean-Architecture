//
//  RemoveFavoriteOfflineUseCase.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/23/24.
//

import Foundation

// MARK: - Protocol -

protocol RemoveFavoriteOfflineUseCase {
    func execute(movie: MovieEntity)
}

// MARK: - Implementation -

class RemoveFavoriteOfflineUseCaseImpl: RemoveFavoriteOfflineUseCase {
    private let favoritesOfflineRepository: FavoritesOfflineRepository
    
    init(favoritesOfflineRepository: FavoritesOfflineRepository) {
        self.favoritesOfflineRepository = favoritesOfflineRepository
    }
    
    func execute(movie: MovieEntity) {
        favoritesOfflineRepository.removeFavorite(movie: movie)
    }
}
