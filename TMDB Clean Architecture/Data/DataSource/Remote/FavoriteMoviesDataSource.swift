//
//  FavoriteMoviesDataSource.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/17/24.
//

import Foundation


protocol FavoriteMoviesDataSource {
    func getFavoriteMovies(page: Int) async throws -> [MovieDTO]
    func postMovieToFavorites(movieId: Int) async throws -> PostMovieToFavoritesResponseDTO
    func deleteMovieFromFavorites(movieId: Int) async throws -> PostMovieToFavoritesResponseDTO
    
}

// MARK: - Implementation -

class DefaultFavoriteMoviesDataSource: FavoriteMoviesDataSource {
    
    private let requestManager: RequestManager
    
    init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }
    
    func getFavoriteMovies(page: Int) async throws -> [MovieDTO] {
        let request = FavoriteMoviesRequest.getFavoriteMovies(page: page)
        let response: MovieListDTO = try await requestManager.makeRequest(with: request)
        guard let unwrappedResponse = response.results else {
            print("error fetching Now Playing movies: NIL RESPONSE")
            return []
        }
        return unwrappedResponse
    }
    
    func postMovieToFavorites(movieId: Int) async throws -> PostMovieToFavoritesResponseDTO {
        let request = FavoriteMoviesRequest.postMovieToFavorites(movieId: movieId)
        let response: PostMovieToFavoritesResponseDTO = try await requestManager.makeRequest(with: request)
        return response
    }
    
    func deleteMovieFromFavorites(movieId: Int) async throws -> PostMovieToFavoritesResponseDTO {
        let request = FavoriteMoviesRequest.deleteMovieFromFavorites(movieId: movieId)
        let response: PostMovieToFavoritesResponseDTO = try await requestManager.makeRequest(with: request)
        return response
    }
    
}
