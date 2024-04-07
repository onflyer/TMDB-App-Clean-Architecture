//
//  AddFavoriteOfflineUseCase.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/23/24.
//

import Foundation

// MARK: - Protocol -

protocol AddFavoriteOfflineUseCase {
    func execute(movie: MovieEntity) async
}

// MARK: - Implementation -

class AddFavoriteOfflineUseCaseImpl: AddFavoriteOfflineUseCase {
    private let favoritesOfflineRepository: FavoritesOfflineRepository
    
    init(favoritesOfflineRepository: FavoritesOfflineRepository) {
        self.favoritesOfflineRepository = favoritesOfflineRepository
    }
    
    func execute(movie: MovieEntity) async {
       await favoritesOfflineRepository.addFavorite(movie: movie)
    }
}
