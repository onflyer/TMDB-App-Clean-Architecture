//
//  DefaultMoviesRepository.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/16/24.
//

import Foundation


class DefaultMoviesRepository: MovieListRepository {
    
    private let moviesDatasource: MovieDataSource
    
    init(moviesDatasource: MovieDataSource) {
        self.moviesDatasource = moviesDatasource
    }
    
    
    func getMovies() async -> Result<[MovieEntity], AppError> {
        do {
            let data = try await moviesDatasource.getNowPlayingMovies()
            let nowPlayingMovies = data.map({
                $0.toDomain()
            })
            return .success(nowPlayingMovies)
        } catch {
            print(error)
            return .failure(.networkError(error.localizedDescription))
        }
    }
}
