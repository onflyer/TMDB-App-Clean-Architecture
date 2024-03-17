//
//  GetMoviesUseCase.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/12/24.
//

import Foundation

protocol GetNowPlayingMoviesUseCase {
    
    func execute() async -> Result<[MovieEntity],AppError>
}

class GetNowPlayingMoviesUseCaseImpl : GetNowPlayingMoviesUseCase {
    private var repository: MovieListRepository
    
    init(repository: MovieListRepository) {
        self.repository = repository
    }
    
    func execute() async -> Result<[MovieEntity], AppError> {
        
        return await repository.getNowPlayingMovies()
    }
}
