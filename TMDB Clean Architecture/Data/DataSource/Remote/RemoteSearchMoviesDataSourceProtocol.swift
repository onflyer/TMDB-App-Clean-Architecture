//
//  SearchMoviesDataSource.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/17/24.
//

import Foundation

protocol RemoteSearchMoviesDataSourceProtocol {
    func searchMovie(query: String) async throws -> [MovieDTO]
}

class DefaultRemoteSearchMoviesDataSource: RemoteSearchMoviesDataSourceProtocol {
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func searchMovie(query: String) async throws -> [MovieDTO] {
        let request = SearchMoviesRequest.searchMovies(query: query)
        let response: MovieListDTO = try await networkService.makeRequest(with: request)
        guard let unwrappedResponse = response.results else {
            print("error fetching Upcoming movies: NIL RESPONSE")
            return []
        }
        return unwrappedResponse
    }
    
}
