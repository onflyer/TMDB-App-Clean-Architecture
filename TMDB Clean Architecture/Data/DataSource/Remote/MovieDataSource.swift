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
        guard let unwrappedResponse = response.results else {
            print("error fetching Now Playing movies: NIL RESPONSE")
            return []
        }
        return unwrappedResponse
    }
    
    func getUpcomingMovies() async throws -> [MovieDTO] {
        let request = MoviesRequest.getUpcomingMovies
        let response: MovieListDTO = try await requestManager.makeRequest(with: request)
        guard let unwrappedResponse = response.results else {
            print("error fetching Upcoming movies: NIL RESPONSE")
            return []
        }
        return unwrappedResponse
    }
    
    func getTopRatedMovies() async throws -> [MovieDTO] {
        let request = MoviesRequest.getTopRatedMovies
        let response: MovieListDTO = try await requestManager.makeRequest(with: request)
        guard let unwrappedResponse = response.results else {
            print("error fetching Top Rated movies: NIL RESPONSE")
            return []
        }
        return unwrappedResponse
    }
    
    func getPopularMovies() async throws -> [MovieDTO] {
        let request = MoviesRequest.getPopularMovies
        let response: MovieListDTO = try await requestManager.makeRequest(with: request)
        guard let unwrappedResponse = response.results else {
            print("error fetching Top Rated movies: NIL RESPONSE")
            return []
        }
        return unwrappedResponse
    }
}
