//
//  ViewModel.swift
//  TMDB Movies - Apple's MV Architecture
//
//  Created by Aleksandar Milidrag on 10/8/23.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class ViewModel: ObservableObject {
    
    private var httpClient: HTTPClient
    
    @Published var query = ""
    private var cancellables = Set<AnyCancellable>()
    
    @Published var alert: CustomAlert? = nil
    @Published var showAlert: Bool = false
    
    @Published var isLoading: Bool = false
    
    @Published var movie: SingleMovieResponse? = nil
    @Published var nowPlayingMovies: [Movie] = []
    @Published var upcomingMovies: [Movie] = []
    @Published var topRatedMovies: [Movie] = []
    @Published var popularMovies: [Movie] = []
    @Published var searchedMovies: [Movie] = []
    private var page = 1
   
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
     func addSubscribers() {
        
        $query
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { query in
                Task {
                   
                    try await self.search(query: query)
                }
            }
            .store(in: &cancellables)
    }
    
     func search(query: String) async throws {
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !query.isEmpty else {
            searchedMovies.removeAll()
            return
        }
        isLoading = true
        do {
            try await self.searchMovie(query: trimmedQuery)
        } catch {
            print(error)
        }
        isLoading = false
        
    }
    
    func searchMovie(query: String) async throws {
        let resource = Resource(url: Constants.Urls.searchURL, method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef"),URLQueryItem(name: "language", value: "en-US"),URLQueryItem(name: "include_adult", value: "true"),URLQueryItem(name: "region", value: "US"),URLQueryItem(name: "query", value: query)]), modelType: MovieResponse.self)
        
        let searchResults = try await httpClient.load(resource)
        searchedMovies = searchResults.results
    }
    
    func fetchNowPlayingMovies() async throws {
        let resource = Resource(url: Constants.Urls.nowPlaying,method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef")]), modelType: MovieResponse.self)
        
        let movieResults = try await httpClient.load(resource)
        nowPlayingMovies = movieResults.results
        
        
    }
    func fetchNextPageOfNowPlayingMovies() async throws {
        page += 1
        let resource = Resource(url: Constants.Urls.nowPlaying,method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef"), URLQueryItem(name: "page", value: String(page))]), modelType: MovieResponse.self)
        
        let movieResults = try await httpClient.load(resource)
        nowPlayingMovies.append(contentsOf: movieResults.results) 
        
        
    }
    
    func fetchUpcomingMovies() async throws {
        let resource = Resource(url: Constants.Urls.upcoming,method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef")]), modelType: MovieResponse.self)
        
        let movieResults = try await httpClient.load(resource)
        upcomingMovies = movieResults.results
        
        
    }
    
    func fetchTopRatedMovies() async throws {
        let resource = Resource(url: Constants.Urls.topRated,method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef")]), modelType: MovieResponse.self)
        
        let movieResults = try await httpClient.load(resource)
        topRatedMovies = movieResults.results
        
        
    }
    
    func fetchPopularMovies() async throws {
        let resource = Resource(url: Constants.Urls.popular,method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef")]), modelType: MovieResponse.self)
        
        let movieResults = try await httpClient.load(resource)
        popularMovies = movieResults.results
        
        
    }
    
    func fetchSingleMovie(movieId: Int) async throws {
        let resource = Resource(url: Constants.Urls.singleMovie(movieId: movieId), method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef"), URLQueryItem(name: "append_to_response", value: "videos,credits")]), modelType: SingleMovieResponse.self)
        
        movie = try await httpClient.load(resource)
    }
    
    
    
    
}
