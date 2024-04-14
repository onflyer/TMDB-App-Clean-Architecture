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
        let expectedMovieToProvideId = [MovieEntity(id: 1, posterPath: "testPoster1", coreDataTitle: "title1")]
        mock.movies = expectedMovieToProvideId
        
        let expectedResponse = SingleMovieEntity(adult: false, backdropPath: "https://image.tmdb.org/t/p/w500/vimaZK2bkJlePnZ1yV5eKYpQkzF.jpg", budget: 15000000, genres: [GenreEntity(id: 14, name: "Drama")], homepage: "homepage", id: 1, imdbID: "tt0169547", originalLanguage: "en", originalTitle: "American Beauty", overview: "Lester Burnham, a depressed suburban father in a mid-life crisis, decides to turn his hectic life around after developing an infatuation with his daughter's attractive friend.", popularity: 34.92, posterPath: "https://image.tmdb.org/t/p/w500/wby9315QzVKdW9BonAefg8jGTTb.jpg", releaseDate: "1999-09-15", revenue: 356296601, runtime: 122, status: "Released", tagline: "Look closer.", title: "title1", video: false, voteAverage: 8.02, voteCount: 11379,ratingtext: "★★★★★★★", scoreText: "8/10",durationText: "n/a", videos: MovieVideoResponseEntity(results: [MovieVideoEntity(name: "American Beauty (1999) Trailer 2", key: "IJM3cZlqwlA", site: "YouTube", id: "5fd7d94362f3350040ffc18b", youtubeURL: URL(string: "IJM3cZlqwlA"))]), credits: CreditsEntity(cast: [CastEntity(adult: false, gender: 2, id: 1979, knownForDepartment: "Acting", name: "Kevin Spacey", originalName: "Kevin Spacey", popularity: 15.124, profilePath: "/dlVRkUYKyZdJ39AN55cY1LoyXAP.jpg", castID: 6, character: "Lester Burnham", creditID: "52fe420ec3a36847f80007db", order: 0, department: "Directing", job: "Writer")], crew: [CastEntity(adult: false, gender: 2, id: 153, knownForDepartment: "Sound", name: "Thomas Newman", originalName: "Thomas Newman", popularity: 2.721, profilePath: "/j8rIiOSdBjtDL5vji8m5BtChZou.jpg", castID: 6, character: "Lester Burnham", creditID: "52fe420ec3a36847f80007db", order: 0, department: "Sound", job: "Original Music Composer")], directors: nil, producers: nil, screenWriters: nil ))
        mock.movie = expectedResponse
        
        let sut = GetMoviebyIdUseCaseImpl(repository: mock)
        let result = try? await sut.execute(movieId: expectedMovieToProvideId.first?.id ?? 0)
        
        XCTAssertEqual(expectedMovieToProvideId.first?.id, expectedResponse.id)
        XCTAssertEqual(expectedMovieToProvideId.first?.title, expectedResponse.title)
        
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
