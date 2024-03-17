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
}
