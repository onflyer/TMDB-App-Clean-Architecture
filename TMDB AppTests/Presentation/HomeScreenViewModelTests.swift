//
//  HomeScreenViewModelTests.swift
//  TMDB AppTests
//
//  Created by Aleksandar Milidrag on 4/21/24.
//

import Foundation
import XCTest
@testable import TMDB_App

class HomeScreenViewModelTests: XCTestCase {
    
   @MainActor func test_whenUseCaseGetsEmptyPage_thenViewModelIsEmpty() async {
        let mock = GetNowPlayingMoviesMockUseCase()
        let mock1 = GetTopRatedMockUseCase()
        let mock2 = GetPopularMoviesMockUseCase()
        let mock3 = GetUpcomingMoviesMockUseCase()
        let expectedResponse: [MovieEntity] = []
        mock.movies = expectedResponse
        
        let viewModel = HomeViewModel(getNowPlayingMoviesUseCase: mock, getUpcomingMoviesUseCase: mock3, getTopRatedMoviesUseCase: mock1, getPopularMoviesUseCase: mock2)
        
       _ = try? await mock.execute(page: 1)
       viewModel.state = .empty
       
       XCTAssertTrue(viewModel.nowPlayingMovies.isEmpty)
       XCTAssertTrue(viewModel.state == .empty)

    }
    
    @MainActor func test_whenUseCaseGetsResult_thenViewModelMoviesIsPopulated() async {
         let mock = GetNowPlayingMoviesMockUseCase()
         let mock1 = GetTopRatedMockUseCase()
         let mock2 = GetPopularMoviesMockUseCase()
         let mock3 = GetUpcomingMoviesMockUseCase()
         let expectedResponse = [MovieEntity(id: 1, posterPath: "testPoster1", coreDataTitle: "title1"),
                                MovieEntity(id: 2, posterPath: "testPoster2", coreDataTitle: "title2"),
                                MovieEntity(id: 3, posterPath: "testPoster3", coreDataTitle: "title3")]
         mock.movies = expectedResponse
         
         let viewModel = HomeViewModel(getNowPlayingMoviesUseCase: mock, getUpcomingMoviesUseCase: mock3, getTopRatedMoviesUseCase: mock1, getPopularMoviesUseCase: mock2)
         
        let result = try? await mock.execute(page: 1)
        viewModel.state = .success
        
        XCTAssertEqual(result, expectedResponse)
        XCTAssertTrue(viewModel.state == .success)

     }
    
    
    @MainActor func test_whenUseCaseGetsError_thenViewModelThrowsAnError() async {
         
        let mock = GetNowPlayingMoviesMockUseCase()
         let mock1 = GetTopRatedMockUseCase()
         let mock2 = GetPopularMoviesMockUseCase()
         let mock3 = GetUpcomingMoviesMockUseCase()
         let expectedError = AppError.networkError("testingError")
         mock.error = expectedError
         
         let viewModel = HomeViewModel(getNowPlayingMoviesUseCase: mock, getUpcomingMoviesUseCase: mock3, getTopRatedMoviesUseCase: mock1, getPopularMoviesUseCase: mock2)
        
         
        do {
            _ = try await mock.execute(page: 1)
            XCTFail("Expected to throw an error, but it did not")
        } catch let error as AppError {
            viewModel.state = .error(error.localizedDescription)
            XCTAssertEqual(error, expectedError)
            XCTAssertTrue(viewModel.state == .error(error.localizedDescription))
        } catch {
            print(error.localizedDescription)
        }
     }
}
