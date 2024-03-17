//
//  GetFavoritesUseCase.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/12/24.
//

import Foundation

protocol GetFavoritesUseCase {
    func execute(page: Int) async -> Result<[MovieEntity],AppError>
}

class GetFavoritesUseCaseImpl: GetFavoritesUseCase {
    private let repository: FavoritesRepository
    
    init(repository: FavoritesRepository) {
        self.repository = repository
    }
    
    func execute(page: Int) async -> Result<[MovieEntity], AppError> {
        return await repository.getFavoriteMovies(page: page)
    }
}
