//
//  CheckFavoriteOfflineUseCase.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/23/24.
//

import Foundation

// MARK: - Protocol -

protocol CheckFavoriteOfflineUseCase {
    func execute(movie: MovieEntity) -> Bool
}

// MARK: - Implementation -

class DefaultCheckFavoriteOfflineUseCase: CheckFavoriteOfflineUseCase {
    private let favoritesOfflineRepository: FavoritesOfflineRepository
    
    init(favoritesOfflineRepository: FavoritesOfflineRepository) {
        self.favoritesOfflineRepository = favoritesOfflineRepository
    }
    
    func execute(movie: MovieEntity) -> Bool {
        favoritesOfflineRepository.isFavorite(movie: movie)
    }
}
