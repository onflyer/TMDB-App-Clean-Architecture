//
//  SearchMoviesRepository.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/12/24.
//

import Foundation

protocol SearchMovieRepository {
    
    func searchMovie(query: String) async throws -> [MovieEntity]
}
