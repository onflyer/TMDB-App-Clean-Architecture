//
//  TMDB_AppTests.swift
//  TMDB AppTests
//
//  Created by Aleksandar Milidrag on 4/11/24.
//

import XCTest
@testable import TMDB_App

final class GetNowPlayingMoviesTests: XCTestCase {

    func test_nowPlayingMoviesUseCaseSuccess() async throws {
        let mock = MovieListMockRepository()
        let expectedResponse = [MovieEntity(id: 1, posterPath: "testPoster1", coreDataTitle: "title1"),
                                MovieEntity(id: 2, posterPath: "testPoster2", coreDataTitle: "title2"),
                                MovieEntity(id: 3, posterPath: "testPoster3", coreDataTitle: "title3")]
        mock.movies = expectedResponse
        let sut = GetNowPlayingMoviesUseCaseImpl(repository: mock)
        
        let result = try? await sut.execute(page: 1)
        
        XCTAssertEqual(result, expectedResponse)
    }
    
    func test_nowPlayingMoviesUseCaseFailure() async throws {
        let mock = MovieListMockRepository()
        let expectedError = AppError.unknownError("testingError")
        mock.error = expectedError
        let sut = GetNowPlayingMoviesUseCaseImpl(repository: mock)
        
        do {
            _ = try await sut.execute(page: 1)
            XCTFail("Expected to throw an error, but it did not")
        } catch let error as AppError {
            XCTAssertEqual(error, expectedError)
        }
    }
    
    
}


