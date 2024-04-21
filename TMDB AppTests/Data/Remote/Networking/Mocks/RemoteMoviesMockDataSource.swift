//
//  RemoteMoviesMockDataSource.swift
//  TMDB AppTests
//
//  Created by Aleksandar Milidrag on 4/20/24.
//

import Foundation
@testable import TMDB_App

class RemoteMoviesMockDataSource: RemoteMovieDataSourceProtocol {
    
    
    func getNowPlayingMovies(page: Int) async throws -> [MovieDTO] {
        try await getMovies()
    }
    
    func getUpcomingMovies(page: Int) async throws -> [MovieDTO] {
        try await getMovies()
    }
    
    func getTopRatedMovies(page: Int) async throws -> [MovieDTO] {
        try await getMovies()
    }
    
    func getPopularMovies(page: Int) async throws -> [MovieDTO] {
        try await getMovies()
    }
    
    func getMovieById(movieId: Int) async throws -> SingleMovieDTO? {
        try await getMovie()
    }
    
    var movies: [MovieDTO]?
    var movie: SingleMovieDTO?
    var error: Error?
    
    func getMovies() async throws -> [MovieDTO] {
        if let error = error {
            throw error
        }
        if let movies = movies {
            return movies
        }
        fatalError("MovieListMockRepository not properly set up")
    }
    
    func getMovie() async throws -> SingleMovieDTO? {
        
        if let error = error {
            throw error
        }
        if let movie = movie {
            return movie
        }
        fatalError("MovieListMockRepository not properly set up")
    }
}
