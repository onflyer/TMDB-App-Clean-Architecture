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
    
    
    func getNowPlayingMovies() async -> Result<[MovieEntity], AppError> {
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
    
    func getUpcomingMovies() async -> Result<[MovieEntity], AppError> {
        do {
            let data = try await moviesDatasource.getUpcomingMovies()
            let upcomingMovies = data.map({
                $0.toDomain()
            })
            return .success(upcomingMovies)
        } catch {
            print(error)
            return .failure(.networkError(error.localizedDescription))
            
        }
        
    }
    
    func getTopRatedMovies() async -> Result<[MovieEntity], AppError> {
        do {
            let data = try await moviesDatasource.getTopRatedMovies()
            let topRatedMovies = data.map({
                $0.toDomain()
            })
            return .success(topRatedMovies)
        } catch {
            return .failure(.networkError(error.localizedDescription))
        }
    }
    
    func getPopularMovies() async -> Result<[MovieEntity], AppError> {
        do {
            let data = try await moviesDatasource.getPopularMovies()
            let popularMovies = data.map({
                $0.toDomain()
            })
            return .success(popularMovies)
        } catch {
            return .failure(.networkError(error.localizedDescription))
        }
    }
}
