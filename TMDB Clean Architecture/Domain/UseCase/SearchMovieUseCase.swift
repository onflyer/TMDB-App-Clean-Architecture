//
//  SearchMovieUseCase.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/12/24.
//

import Foundation

protocol SearchMovieUseCase {
    func execute(query: String) async throws -> [MovieEntity]
}

class SearchMovieUseCaseImpl: SearchMovieUseCase {
    private let repository: SearchMovieRepository
    
    init(repository: SearchMovieRepository) {
        self.repository = repository
    }
    
    func execute(query: String) async throws -> [MovieEntity] {
        return try await repository.searchMovie(query: query)
    }
}
