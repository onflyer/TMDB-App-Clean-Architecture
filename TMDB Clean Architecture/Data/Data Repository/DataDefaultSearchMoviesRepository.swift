//
//  DefaultSearchMoviesRepository.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/17/24.
//

import Foundation

class DataDefaultSearchMoviesRepository: SearchMovieRepository {
    
    private let moviesDatasource: RemoteSearchMoviesDataSourceProtocol
    
    init(moviesDatasource: RemoteSearchMoviesDataSourceProtocol) {
        self.moviesDatasource = moviesDatasource
    }
    
    
    func searchMovie(query: String) async throws -> [MovieEntity] {
       
            let data = try await moviesDatasource.searchMovie(query: query)
            let searchedMovies = data.map({
                $0.toDomain()
            })
            return searchedMovies
    }
}
