//
//  GetMoviesUseCase.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/12/24.
//

import Foundation

protocol GetMoviesUseCase {
    
    func execute() async -> Result<[MovieEntity],AppError>
}

class GetMoviesUseCaseImpl : GetMoviesUseCase {
    private var repository: MovieListRepository
    
    init(repository: MovieListRepository) {
        self.repository = repository
    }
    
    func execute() async -> Result<[MovieEntity], AppError> {
        
        return await repository.getNowPlayingMovies()
    }
}
