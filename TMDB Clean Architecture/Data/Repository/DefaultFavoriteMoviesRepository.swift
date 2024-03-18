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
    
    
    func getFavoriteMovies(page: Int) async -> Result<[MovieEntity], AppError> {
        do {
            let data = try await moviesDatasource.getFavoriteMovies(page: page)
            let favoriteMovies = data.map({
                $0.toDomain()
            })
            return .success(favoriteMovies)
        } catch {
            print(error)
            return .failure(.networkError(error.localizedDescription))
        }
    }
    
    func postMovieToFavorites(mediaId: Int) async -> Result<PostMovieToFavoritesResponseEntity,AppError> {
        do {
            let data = try await moviesDatasource.postMovieToFavorites(movieId: mediaId)
            let postToFavoritesResponseEntity = data.toDomain()
            return .success(postToFavoritesResponseEntity)
        } catch {
            print(error)
            return .failure(.networkError(error.localizedDescription))
        }
    }
    
    func deleteMovieFromFavorites(mediaId: Int) async -> Result<PostMovieToFavoritesResponseEntity, AppError> {
        do {
            let data = try await moviesDatasource.deleteMovieFromFavorites(movieId: mediaId)
            let deleteMovieFromFavoritesResponseEntity = data.toDomain()
            return .success(deleteMovieFromFavoritesResponseEntity)
        } catch {
            print(error)
            return .failure(.networkError(error.localizedDescription))
        }
    }
    
}
