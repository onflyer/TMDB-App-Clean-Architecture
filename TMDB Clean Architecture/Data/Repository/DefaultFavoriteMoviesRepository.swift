//
//  DefaultFavoriteMoviesRepository.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/17/24.
//

import Foundation

class DefaultFavoriteMoviesRepository: FavoritesRepository {
    
    private let moviesDatasource: FavoriteMoviesDataSource
    
    init(moviesDatasource: FavoriteMoviesDataSource) {
        self.moviesDatasource = moviesDatasource
    }
    
    
    func getFavoriteMovies(page: Int) async throws -> [MovieEntity] {
       
            let data = try await moviesDatasource.getFavoriteMovies(page: page)
            let favoriteMovies = data.map({
                $0.toDomain()
            })
            return favoriteMovies
       
    }
    
    func postMovieToFavorites(mediaId: Int) async throws -> PostMovieToFavoritesResponseEntity {
       
            let data = try await moviesDatasource.postMovieToFavorites(movieId: mediaId)
            let postToFavoritesResponseEntity = data.toDomain()
            return postToFavoritesResponseEntity
    }
    
    func deleteMovieFromFavorites(mediaId: Int) async throws -> PostMovieToFavoritesResponseEntity {
        
            let data = try await moviesDatasource.deleteMovieFromFavorites(movieId: mediaId)
            let deleteMovieFromFavoritesResponseEntity = data.toDomain()
            return deleteMovieFromFavoritesResponseEntity
    }
    
}
