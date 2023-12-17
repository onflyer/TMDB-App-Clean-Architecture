//
//  MovieDetailScreenViewModel.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/17/23.
//

import Foundation


@MainActor
final class MovieDetailScreenViewModel: ObservableObject {
    
    let httpClient: HTTPClient
    
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    
    @Published var isLoading: Bool = false
    @Published var movie: SingleMovieResponse? = nil
    
    
    func fetchSingleMovie(movieId: Int) async throws {
        let resource = Resource(url: Constants.Urls.singleMovie(movieId: movieId), method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef"), URLQueryItem(name: "append_to_response", value: "videos,credits")]), modelType: SingleMovieResponse.self)
        
        movie = try await httpClient.load(resource)
    }
    func loadMoviebyId(movieId: Int) async {
        self.isLoading = true
        do {
            try await self.fetchSingleMovie(movieId: movieId)
            self.isLoading = false
        } catch {
            print(error)
        }
    }
    
}
