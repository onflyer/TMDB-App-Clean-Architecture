//
//  GetMovieByIdUseCaseTests.swift
//  TMDB AppTests
//
//  Created by Aleksandar Milidrag on 4/14/24.
//

import XCTest
@testable import TMDB_App

final class GetMovieByIdUseCaseTests: XCTestCase {
    
    func test_getMovieByIdSuccess() async throws {
        let mock = MovieListMockRepository()
        let expectedResponse = SingleMovieEntity.dummySingleMovie()
        mock.movie = expectedResponse
        
        let sut = GetMoviebyIdUseCaseImpl(repository: mock)
        let result = try? await sut.execute(movieId: 14)
        
        XCTAssertEqual(result, expectedResponse)
        
    }
    
    func test_getMovieByIdFailure() async throws {
        let mock = MovieListMockRepository()
        let expectedError = AppError.unknownError("testingError")
        mock.error = expectedError
        
        let sut = GetMoviebyIdUseCaseImpl(repository: mock)
        
        do {
            _ = try await sut.execute(movieId: 14)
            XCTFail("Expected to throw an error, but it did not")
        } catch let error as AppError {
            XCTAssertEqual(error, expectedError)
        }
    }
    
    func test_getMovieByIdIsNil() async throws {
        let mock = MovieListMockRepository()
        let _ = GetMoviebyIdUseCaseImpl(repository: mock)
        
        XCTAssertEqual(nil, mock.movie)
    }
}
