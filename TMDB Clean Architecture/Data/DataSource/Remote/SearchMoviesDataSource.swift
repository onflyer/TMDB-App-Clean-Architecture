//
//  SearchMoviesDataSource.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/17/24.
//

import Foundation

protocol SearchMoviesDataSource {
    func searchMovie(query: String) async throws -> [MovieDTO]
}

class DefaultSearchMoviesDataSource: SearchMoviesDataSource {
    let requestManager: RequestManager
    
    init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }
    
    func searchMovie(query: String) async throws -> [MovieDTO] {
        let request = SearchMoviesRequest.searchMovies(query: query)
        let response: MovieListDTO = try await requestManager.makeRequest(with: request)
        guard let unwrappedResponse = response.results else {
            print("error fetching Upcoming movies: NIL RESPONSE")
            return []
        }
        return unwrappedResponse
    }
    
}
