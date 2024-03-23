//
//  AddFavoriteOfflineUseCase.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/23/24.
//

import Foundation

// MARK: - Protocol -

protocol AddFavoriteOfflineUseCase {
    func execute(movie: MovieEntity)
}

// MARK: - Implementation -

class DefaultAddFavoriteOfflineUseCase: AddFavoriteOfflineUseCase {
    private let favoritesOfflineRepository: FavoritesOfflineRepository
    
    init(favoritesOfflineRepository: FavoritesOfflineRepository) {
        self.favoritesOfflineRepository = favoritesOfflineRepository
    }
    
    func execute(movie: MovieEntity) {
        if favoritesOfflineRepository.isFavorite(movie: movie) {
            favoritesOfflineRepository.removeFavorite(movie: movie)
        } else {
            favoritesOfflineRepository.addFavorite(movie: movie)
        }
    }
}
