//
//  FavoritesOfflineRepository.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/23/24.
//

import Foundation

protocol FavoritesOfflineRepository {
    
    /// Get all favorites movies from local storage
    func getFavorites() -> Result<[MovieEntity], AppError>
    
    /// Check if movie is favorite or not
    func isFavorite(movie: MovieEntity) -> Bool
    
    /// Add movie to favorites
    func addFavorite(movie: MovieEntity) async
    
    /// Remove movie from favorites
    func removeFavorite(movie: MovieEntity)
}
