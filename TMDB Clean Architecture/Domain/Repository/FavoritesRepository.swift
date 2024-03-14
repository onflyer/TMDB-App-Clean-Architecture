//
//  FavoritesRepository.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/12/24.
//

import Foundation

protocol FavoritesRepository {
    
    func getFavorites() async -> Result<[MovieEntity],AppError>
}
