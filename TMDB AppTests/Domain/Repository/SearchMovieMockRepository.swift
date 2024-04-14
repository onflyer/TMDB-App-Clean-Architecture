//
//  MovieSearchMockRepository.swift
//  TMDB AppTests
//
//  Created by Aleksandar Milidrag on 4/14/24.
//

import Foundation
@testable import TMDB_App

class SearchMovieMockRepository: SearchMovieRepository {
        
    func searchMovie(query: String) async throws -> [MovieEntity] {
        try await getMovies()
    }
    
    
    //MARK: HELPERS
    
    var movies: [MovieEntity]?
    var error: AppError?
    
    func getMovies() async throws -> [MovieEntity] {
        if let error = error {
            throw error
        }
        if let movies = movies {
            return movies
        }
        fatalError("MovieListMockRepository not properly set up")
    }

}
