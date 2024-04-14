//
//  DefaultFavoriteMoviesOfflineRepository.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/23/24.
//

import Foundation

class DefaultFavoriteMoviesOfflineRepository: FavoritesOfflineRepository {
    
    private let dataSource: FavoritesOfflineDataSource
    
    init(dataSource: FavoritesOfflineDataSource) {
        self.dataSource = dataSource
    }
    
    
    func getFavorites() throws -> [MovieEntity] {
            let movies = try dataSource.getFavorites()
            return movies
    }
    
    func isFavorite(movie: MovieEntity) -> Bool {
        do {
            let result = try dataSource.isFavorite(movie: movie)
            return result
        } catch {
            return false
        }
    }
    
    func addFavorite(movie: MovieEntity) async {
        do {
            try await dataSource.addFavorite(movie: movie)
        } catch {
            print("Local DS: \(error.localizedDescription)")
        }
    }
    
    func removeFavorite(movie: MovieEntity) {
        do {
            try dataSource.removeFavorite(movie: movie)
        } catch {
            print("Local DS: \(error.localizedDescription)")
        }
    }
    
    
}
