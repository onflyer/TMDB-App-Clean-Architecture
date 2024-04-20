//
//  DefaultRemoteMovieMockDataSource.swift
//  TMDB AppTests
//
//  Created by Aleksandar Milidrag on 4/20/24.
//

import Foundation
@testable import TMDB_App

class DefaultRemoteMovieMockDataSource: RemoteMovieDataSourceProtocol {
    func getNowPlayingMovies(page: Int) async throws -> [MovieDTO] {
        return []
    }
    
    func getUpcomingMovies(page: Int) async throws -> [MovieDTO] {
        return []
    }
    
    func getTopRatedMovies(page: Int) async throws -> [MovieDTO] {
           return []
    }
    
    func getPopularMovies(page: Int) async throws -> [MovieDTO] {
            return[]
    }
    
    func getMovieById(movieId: Int) async throws -> SingleMovieDTO? {
        return nil
    }
    
    
}
