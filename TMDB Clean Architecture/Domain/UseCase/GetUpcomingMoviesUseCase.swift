//
//  GetUpcomingMoviesUseCase.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/17/24.
//

import Foundation

protocol GetUpcomingMoviesUseCase {
    func execute(page: Int) async throws -> [MovieEntity]
}

class GetUpcomingMoviesUseCaseImpl: GetUpcomingMoviesUseCase  {
    private let repository: MovieListRepository
    
    init(repository: MovieListRepository) {
        self.repository = repository
    }
    
    func execute(page: Int) async throws -> [MovieEntity] {
        return try await repository.getUpcomingMovies(page: page)
    }
}
