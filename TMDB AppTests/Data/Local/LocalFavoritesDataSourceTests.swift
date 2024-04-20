//
//  LocalFavoritesDataSourceTests.swift
//  TMDB AppTests
//
//  Created by Aleksandar Milidrag on 4/20/24.
//

import Foundation
import CoreData
import XCTest
@testable import TMDB_App

class LocalFavoritesDataSourceTests: XCTestCase {
    
    func test_getFavoritesSuccess() {
        let coreDataService = CoreDataMockService()
        let sut = DefaultLocalFavoriteMoviesDataSource(coreDataService: coreDataService)
        
        let fakeMovie = MovieEntity(id: 1, posterPath: "testPath", coreDataTitle: "testTitle")
        let fakeMovie2 = MovieEntity(id: 2, posterPath: "testPath2", coreDataTitle: "testTitle2")
        
        let derivedContext = coreDataService.newBackgroundContext()
        
        let movieToCoreData = CoreDataDTO(context: derivedContext)
        movieToCoreData.id = 1
        movieToCoreData.posterPath = "testPath"
        movieToCoreData.title = "testTitle"
        
        let movieToCoreData2 = CoreDataDTO(context: derivedContext)
        movieToCoreData2.id = 2
        movieToCoreData2.posterPath = "testPath2"
        movieToCoreData2.title = "testTitle2"
        
        try? derivedContext.save()
        
        do {
            let favorites = try sut.getFavorites()
            
            XCTAssertEqual(favorites.count, 2)
            XCTAssertTrue(favorites.contains(where: { $0.id == fakeMovie.id }))
            XCTAssertTrue(favorites.contains(where: { $0.id == fakeMovie2.id }))
        } catch {
            XCTFail("Expected success, but got failure: \(error)")
        }
        
        
    }
    
    func test_addFavoritesSucces() async {
        let coreDataService = CoreDataMockService()
        let sut = DefaultLocalFavoriteMoviesDataSource(coreDataService: coreDataService)
        
        let fakeMovie = MovieEntity(id: 1, posterPath: "testPath", coreDataTitle: "testTitle")
        
        do {
            try await sut.addFavorite(movie: fakeMovie)
            XCTAssertEqual(try? sut.getFavorites().count, 1)
        } catch {
            XCTFail("Expected success, but got failure: \(error)")
        }
    }
    
    func test_removeFavoriteSucces() {
        let coreDataService = CoreDataMockService()
        let sut = DefaultLocalFavoriteMoviesDataSource(coreDataService: coreDataService)
        
        let fakeMovie = MovieEntity(id: 1, posterPath: "testPath", coreDataTitle: "testTitle")
        
        let derivedContext = coreDataService.newBackgroundContext()
        
        let movieToCoreData = CoreDataDTO(context: derivedContext)
        movieToCoreData.id = 1
        movieToCoreData.posterPath = "testPath"
        movieToCoreData.title = "testTitle"
        
        try? derivedContext.save()
        
        do {
            try sut.removeFavorite(movie: fakeMovie)
            XCTAssertEqual(try? sut.getFavorites().count, 0)
        } catch {
            XCTFail("Expected success, but got failure: \(error)")
        }
    }
}

