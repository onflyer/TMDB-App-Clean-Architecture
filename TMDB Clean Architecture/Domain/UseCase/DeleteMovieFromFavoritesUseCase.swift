//
//  DeleteMovieFromFavoritesUseCase.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/18/24.
//

import Foundation

protocol DeleteMovieFromFavoritesUseCase {
    func execute(mediaId: Int) async -> Result<PostMovieToFavoritesResponseEntity,AppError>
}

class DeleteMovieFromFavoritesUseCaseImpl: DeleteMovieFromFavoritesUseCase {
    private let repository: FavoritesRepository
    
    init(repository: FavoritesRepository) {
        self.repository = repository
    }
    
    func execute(mediaId: Int) async -> Result<PostMovieToFavoritesResponseEntity,AppError>  {
         await repository.deleteMovieFromFavorites(mediaId: mediaId)
    }
}
