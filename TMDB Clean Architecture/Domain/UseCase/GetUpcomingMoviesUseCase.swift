//
//  GetUpcomingMoviesUseCase.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/17/24.
//

import Foundation

protocol GetUpcomingMoviesUseCase {
    func execute(page: Int) async -> Result<[MovieEntity],AppError>
}

class GetUpcomingMoviesUseCaseImpl: GetUpcomingMoviesUseCase  {
    private let repository: MovieListRepository
    
    init(repository: MovieListRepository) {
        self.repository = repository
    }
    
    func execute(page: Int) async -> Result<[MovieEntity], AppError> {
        return await repository.getUpcomingMovies(page: page)
    }
}
