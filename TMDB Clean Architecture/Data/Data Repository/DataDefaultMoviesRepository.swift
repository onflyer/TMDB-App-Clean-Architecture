//
//  DefaultMoviesRepository.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/16/24.
//

import Foundation


class DataDefaultMoviesRepository: MovieListRepository {
    
    private let moviesDatasource: RemoteMovieDataSourceProtocol
    
    init(moviesDatasource: RemoteMovieDataSourceProtocol) {
        self.moviesDatasource = moviesDatasource
    }
    
    
    func getNowPlayingMovies(page: Int) async throws -> [MovieEntity] {
        
        let data = try await moviesDatasource.getNowPlayingMovies(page: page)
        let nowPlayingMovies = data.map({
            $0.toDomain()
        })
        return nowPlayingMovies
    }

    
    func getUpcomingMovies(page: Int) async throws -> [MovieEntity] {
       
            let data = try await moviesDatasource.getUpcomingMovies(page: page)
            let upcomingMovies = data.map({
                $0.toDomain()
            })
            return upcomingMovies
            
        }
        
        func getTopRatedMovies(page: Int) async throws -> [MovieEntity] {
            
                let data = try await moviesDatasource.getTopRatedMovies(page: page)
                let topRatedMovies = data.map({
                    $0.toDomain()
                })
                return topRatedMovies
            
        }
        
        func getPopularMovies(page: Int) async -> Result<[MovieEntity], AppError> {
            do {
                let data = try await moviesDatasource.getPopularMovies(page: page)
                let popularMovies = data.map({
                    $0.toDomain()
                })
                return .success(popularMovies)
            } catch {
                print(error)
                return .failure(.networkError(error.localizedDescription))
            }
        }
        
        func getMovieById(movieId: Int) async throws -> SingleMovieEntity? {
            
                let data = try await moviesDatasource.getMovieById(movieId: movieId)
                let singleMovie = data?.toDomain()
                return singleMovie
            
      }
}
