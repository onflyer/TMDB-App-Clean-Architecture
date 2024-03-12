//
//  GetFavoritesUseCase.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/12/24.
//

import Foundation

protocol GetFavoritesUseCase {
    func execute() async -> Result<MovieListEntity,AppError>
}

class GetFavoritesUseCaseImpl: GetFavoritesUseCase {
    private let repository: FavoritesRepository
    
    init(repository: FavoritesRepository) {
        self.repository = repository
    }
    
    func execute() async -> Result<MovieListEntity, AppError> {
        return await repository.getFavorites()
    }
}