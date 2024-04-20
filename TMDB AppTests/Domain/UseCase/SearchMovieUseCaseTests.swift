//
//  SearchMovieUseCaseTests.swift
//  TMDB AppTests
//
//  Created by Aleksandar Milidrag on 4/14/24.
//

import XCTest
@testable import TMDB_App

class SearchMovieUseCaseTests: XCTestCase {
    
    func test_searchMovieUseCaseSuccess() async {
        let mock = SearchMovieMockRepository()
        let expectedResponse = [MovieEntity(id: 1, posterPath: "testPoster1", coreDataTitle: "title1"),
                                MovieEntity(id: 2, posterPath: "testPoster2", coreDataTitle: "title2"),
                                MovieEntity(id: 3, posterPath: "testPoster3", coreDataTitle: "title3")]
        mock.movies = expectedResponse
        let sut = SearchMovieUseCaseImpl(repository: mock)
        
        do {
            let result = try await sut.execute(query: "title")
            XCTAssertEqual(result.count, 3)
            XCTAssertTrue(result.contains(where: { $0.id == 1 })) 
            XCTAssertTrue(result.contains(where: { $0.id == 3 }))
        } catch  {
            print(error)
        }
        
        
        
    }
}

