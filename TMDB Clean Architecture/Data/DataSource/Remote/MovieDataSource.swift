//
//  MovieDataSource.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/14/24.
//

import Foundation


// MARK: - Protocol -

protocol MovieDataSource {
    func getNowPlayingMovies() async throws -> [MovieDTO]
    func getUpcomingMovies() async throws -> [MovieDTO]
    func getTopRatedMovies() async throws -> [MovieDTO]
    func getPopularMovies() async throws -> [MovieDTO]
}

// MARK: - Implementation -

class DefaultMovieDataSource: MovieDataSource {
    
    
    private let requestManager: RequestManager
    
    init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }
    
    func getNowPlayingMovies() async throws -> [MovieDTO] {
        let request = MoviesRequest.getNowPlayingMovies
        let response: MovieListDTO = try await requestManager.makeRequest(with: request)
        if let unwrapedResponse = response.results {
            return unwrapedResponse
        }
    }
    
    func getUpcomingMovies() async throws -> [MovieDTO] {
        <#code#>
    }
    
    func getTopRatedMovies() async throws -> [MovieDTO] {
        <#code#>
    }
    
    func getPopularMovies() async throws -> [MovieDTO] {
        <#code#>
    }
}
