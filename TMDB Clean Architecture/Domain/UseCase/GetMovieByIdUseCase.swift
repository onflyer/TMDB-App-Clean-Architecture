//
//  GetMovieById.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/17/24.
//

import Foundation

protocol GetMovieByIdUseCase {
    func execute(movieId: Int) async throws -> SingleMovieEntity?
    
}

class GetMoviebyIdUseCaseImpl: GetMovieByIdUseCase {
    private let repository: MovieListRepository
    
    init(repository: MovieListRepository) {
        self.repository = repository
    }
    
    func execute(movieId: Int) async throws -> SingleMovieEntity? {
        return try await repository.getMovieById(movieId: movieId)
    }
}
