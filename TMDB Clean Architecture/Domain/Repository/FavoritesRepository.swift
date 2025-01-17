//
//  FavoritesRepository.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/12/24.
//

import Foundation

protocol FavoritesRepository {
    
    func getFavoriteMovies(page: Int) async throws -> [MovieEntity]
    func postMovieToFavorites(mediaId: Int) async throws -> PostMovieToFavoritesResponseEntity
    func deleteMovieFromFavorites(mediaId: Int) async throws -> PostMovieToFavoritesResponseEntity
    
}
