//
//  TMDB_AppTests.swift
//  TMDB AppTests
//
//  Created by Aleksandar Milidrag on 4/11/24.
//

import XCTest
@testable import TMDB_App

final class GetNowPlayingMoviesTests: XCTestCase {

    func test_nowPlayingMoviesUseCase() async {
        let mock = MovieListMockRepository()
        let sut = GetNowPlayingMoviesUseCaseImpl(repository: mock)
        
        let expectedResponse = [MovieEntity(id: 1, posterPath: "testPoster1", coreDataTitle: "title1"),
                                MovieEntity(id: 2, posterPath: "testPoster2", coreDataTitle: "title2"),
                                MovieEntity(id: 3, posterPath: "testPoster3", coreDataTitle: "title3")]
        
        let result = try? await sut.execute(page: 1)
        
        XCTAssertEqual(result, expectedResponse)
    }
}


