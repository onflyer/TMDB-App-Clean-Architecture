//
//  MovieListRepository.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/12/24.
//

import Foundation

protocol MovieListRepository {
    
    func getNowPlayingMovies(page: Int) async throws -> [MovieEntity]
    func getUpcomingMovies(page: Int) async throws -> [MovieEntity]
    func getTopRatedMovies(page: Int) async -> Result<[MovieEntity],AppError>
    func getPopularMovies(page: Int) async -> Result<[MovieEntity],AppError>
    func getMovieById(movieId: Int) async -> Result<SingleMovieEntity?, AppError>
    
}
