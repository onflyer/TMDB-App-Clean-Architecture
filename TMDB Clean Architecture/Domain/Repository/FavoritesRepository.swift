//
//  FavoritesRepository.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/12/24.
//

import Foundation

protocol FavoritesRepository {
    
    func getFavoriteMovies(page: Int) async -> Result<[MovieEntity],AppError>
    func postMovieToFavorites(mediaId: Int) async -> Result<PostMovieToFavoritesResponseEntity,AppError>
    
}
