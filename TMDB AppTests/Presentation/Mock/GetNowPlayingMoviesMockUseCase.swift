//
//  GetNowPlayingMoviesMockUseCase.swift
//  TMDB AppTests
//
//  Created by Aleksandar Milidrag on 4/21/24.
//

import Foundation
@testable import TMDB_App

class GetNowPlayingMoviesMockUseCase: GetNowPlayingMoviesUseCase {
   
    func execute(page: Int) async throws -> [MovieEntity] {
        try await getMovies()
    }
    
    
    //MARK: HELPER
    
    var movies: [MovieEntity]?
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
}


class GetTopRatedMockUseCase: GetTopRatedMoviesUseCase {
    
    func execute(page: Int) async throws -> [MovieEntity] {
        try await getMovies()
    }
    
    
    //MARK: HELPER
    
    var movies: [MovieEntity]?
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
}

    class GetUpcomingMoviesMockUseCase: GetUpcomingMoviesUseCase {
       
        func execute(page: Int) async throws -> [MovieEntity] {
            try await getMovies()
        }
        
        
        //MARK: HELPER
        
        var movies: [MovieEntity]?
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
    }
    
    class GetPopularMoviesMockUseCase: GetPopularMoviesUseCase {
       
        func execute(page: Int) async -> Result<[MovieEntity],AppError> {
            await getMovies()
        }
        
        
        //MARK: HELPER
        
        var movies: [MovieEntity]?
        var error: AppError?
        
        func getMovies() async -> Result<[MovieEntity],AppError> {
            if let error = error {
                return .failure(error)
            }
            if let movies = movies {
                return .success(movies)
            }
            fatalError("MovieListMockRepository not properly set up")
        }
    }




