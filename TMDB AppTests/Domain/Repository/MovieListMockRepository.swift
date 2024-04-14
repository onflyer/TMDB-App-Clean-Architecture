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
       try await getMovies()
    }
    
    func getUpcomingMovies(page: Int) async throws -> [MovieEntity] {
        let response = [MovieEntity(id: 1, posterPath: "testPoster1", coreDataTitle: "title1"),
                        MovieEntity(id: 2, posterPath: "testPoster2", coreDataTitle: "title2"),
                        MovieEntity(id: 3, posterPath: "testPoster3", coreDataTitle: "title3")
        ]
        return response
    }
    
    func getTopRatedMovies(page: Int) async throws -> [MovieEntity] {
        let response = [MovieEntity(id: 1, posterPath: "testPoster1", coreDataTitle: "title1"),
                        MovieEntity(id: 2, posterPath: "testPoster2", coreDataTitle: "title2"),
                        MovieEntity(id: 3, posterPath: "testPoster3", coreDataTitle: "title3")
        ]
        return response
    }
    
    func getPopularMovies(page: Int) async -> Result<[MovieEntity], AppError> {
        let response = [MovieEntity(id: 1, posterPath: "testPoster1", coreDataTitle: "title1"),
                        MovieEntity(id: 2, posterPath: "testPoster2", coreDataTitle: "title2"),
                        MovieEntity(id: 3, posterPath: "testPoster3", coreDataTitle: "title3")
        ]
        return .success(response)
    }
    
    func getMovieById(movieId: Int) async throws -> SingleMovieEntity? {
       try await getMovie()
        
    }
    
    //MARK: HELPERS
    
    var movies: [MovieEntity]?
    var movie: SingleMovieEntity?
    var error: AppError?
    
    func getMovies() async throws -> [MovieEntity] {
        if let error = error {
            throw error
        }
        if let movies = movies {
            return movies
        }
        fatalError("MovieListMockRepository not properly set up")
    }
    
    func getMovie() async throws -> SingleMovieEntity? {
        
        if let error = error {
            throw error
        }
        if let movie = movie {
            return movie
        }
        fatalError("MovieListMockRepository not properly set up")
    }
    
    
}
