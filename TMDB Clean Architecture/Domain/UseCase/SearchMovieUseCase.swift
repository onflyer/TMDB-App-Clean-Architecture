//
//  SearchMovieUseCase.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/12/24.
//

import Foundation

protocol SearchMovieUseCase {
    func execute(query: String) async -> Result<[MovieEntity],AppError>
}

class SearchMovieUseCaseImpl: SearchMovieUseCase {
    private let repository: SearchMovieRepository
    
    init(repository: SearchMovieRepository) {
        self.repository = repository
    }
    
    func execute(query: String) async -> Result<[MovieEntity], AppError> {
        return await repository.searchMovie(query: query)
    }
}
