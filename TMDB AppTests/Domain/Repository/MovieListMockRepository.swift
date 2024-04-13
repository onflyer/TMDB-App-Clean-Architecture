//
//  MovieListMockRepository.swift
//  TMDB AppTests
//
//  Created by Aleksandar Milidrag on 4/11/24.
//

import Foundation
@testable import TMDB_App


class MovieListMockRepository: MovieListRepository {
    func getNowPlayingMovies(page: Int) async throws -> [MovieEntity] {
        
            let response = [MovieEntity(id: 1, posterPath: "testPoster1", coreDataTitle: "title1"),
                            MovieEntity(id: 2, posterPath: "testPoster2", coreDataTitle: "title2"),
                            MovieEntity(id: 3, posterPath: "testPoster3", coreDataTitle: "title3")]
            return response
    }
    
    func getUpcomingMovies(page: Int) async -> Result<[MovieEntity], AppError> {
        let response = [MovieEntity(id: 1, posterPath: "testPoster1", coreDataTitle: "title1"),
                        MovieEntity(id: 2, posterPath: "testPoster2", coreDataTitle: "title2"),
                        MovieEntity(id: 3, posterPath: "testPoster3", coreDataTitle: "title3")
        ]
        return .success(response)
    }
    
    func getTopRatedMovies(page: Int) async -> Result<[MovieEntity], AppError> {
        let response = [MovieEntity(id: 1, posterPath: "testPoster1", coreDataTitle: "title1"),
                        MovieEntity(id: 2, posterPath: "testPoster2", coreDataTitle: "title2"),
                        MovieEntity(id: 3, posterPath: "testPoster3", coreDataTitle: "title3")
        ]
        return .success(response)
    }
    
    func getPopularMovies(page: Int) async -> Result<[MovieEntity], AppError> {
        let response = [MovieEntity(id: 1, posterPath: "testPoster1", coreDataTitle: "title1"),
                        MovieEntity(id: 2, posterPath: "testPoster2", coreDataTitle: "title2"),
                        MovieEntity(id: 3, posterPath: "testPoster3", coreDataTitle: "title3")
        ]
        return .success(response)
    }
    
    func getMovieById(movieId: Int) async -> Result<SingleMovieEntity?, AppError> {
        let movie = SingleMovieEntity.dummySingleMovie()
        return .success(movie)
    }
    
    
}
