//
//  DataDefaultMoviesMockRepository.swift
//  TMDB AppTests
//
//  Created by Aleksandar Milidrag on 4/20/24.
//

import Foundation
import XCTest
@testable import TMDB_App

class RemoteMoviesMockDataSourceTests: XCTestCase {
    
    func test_getMoviesSuccess() async throws {
        let sut = RemoteMoviesMockDataSource()
        let movies = [MovieDTO(adult: nil, backdropPath: nil, genreIDS: nil, id: 1, originalTitle: nil, overview: nil, popularity: nil, posterPath: nil, releaseDate: nil, title: "testTitle", video: nil, voteAverage: nil, voteCount: nil),MovieDTO(adult: nil, backdropPath: nil, genreIDS: nil, id: 2, originalTitle: nil, overview: nil, popularity: nil, posterPath: nil, releaseDate: nil, title: "testTitle2", video: nil, voteAverage: nil, voteCount: nil)]
        sut.movies = movies
        
        let results = try await sut.getNowPlayingMovies(page: 1)
        
        XCTAssertEqual(results, movies)
        
    }
}
