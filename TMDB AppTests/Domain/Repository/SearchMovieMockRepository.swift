//
//  MovieSearchMockRepository.swift
//  TMDB AppTests
//
//  Created by Aleksandar Milidrag on 4/14/24.
//

import Foundation
@testable import TMDB_App

class SearchMovieMockRepository: SearchMovieRepository {
    var movies: [MovieEntity]?
    var error: AppError?
    
    func searchMovie(query: String) async throws -> [MovieEntity] {
        return []
    }
    
    
}
