//
//  GetFavoritesOfflineUseCase.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/23/24.
//

import Foundation

protocol GetFavoritesOfflineUseCase {
    func execute() throws -> [MovieEntity]
}

class GetFavoritesOfflineUseCaseImpl: GetFavoritesOfflineUseCase {
    private let favoritesOfflineRepository: FavoritesOfflineRepository
    
    init(favoritesOfflineRepository: FavoritesOfflineRepository) {
        self.favoritesOfflineRepository = favoritesOfflineRepository
    }
    
    func execute() throws -> [MovieEntity] {
       try favoritesOfflineRepository.getFavorites()
    }
}
