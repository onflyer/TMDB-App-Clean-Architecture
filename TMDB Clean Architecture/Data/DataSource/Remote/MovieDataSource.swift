//
//  MovieDataSource.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/14/24.
//

import Foundation


// MARK: - Protocol -

protocol MovieDataSource {
    func getMovies() async throws -> [MovieDTO]
}

// MARK: - Implementation -

class DefaultMovieDataSource: MovieDataSource {
    private let requestManager: RequestManager
    init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }
    
    func getMovies() async throws -> [MovieDTO] {
        return []
//        let request = CharactersRequest.getCharacters(offset: offset, searchKey: searchKey)
//        let response: CharactersResponse = try await requestManager.makeRequest(with: request)
//        return response.data
    }
}
