//
//  GetTopRateMoviesUseCase.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/17/24.
//

import Foundation

protocol GetTopRatedMoviesUseCase {
    func execute() async -> Result<[MovieEntity],AppError>
}

class GetTopRatedMoviesUseCaseImpl: GetTopRatedMoviesUseCase {
    private let repository: MovieListRepository
    
    init(repository: MovieListRepository) {
        self.repository = repository
    }
    
    func execute() async -> Result<[MovieEntity], AppError> {
        return await repository.getTopRatedMovies()
    }
}
