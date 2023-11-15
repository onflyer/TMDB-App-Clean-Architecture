//
//  ViewModel.swift
//  TMDB Movies - Apple's MV Architecture
//
//  Created by Aleksandar Milidrag on 10/8/23.
//

import Foundation
import SwiftUI

@MainActor
class ViewModel: ObservableObject {
    
    @Published var movie: Movie? = nil
    @Published var nowPlayingMovies: [Movie] = []
    @Published var upcomingMovies: [Movie] = []
    @Published var topRatedMovies: [Movie] = []
    @Published var popularMovies: [Movie] = []
    
    
    let httpClient = HTTPClient()
   
    
    
    func fetchNowPlayingMovies() async throws {
        let resource = Resource(url: Constants.Urls.nowPlaying,method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef")]), modelType: MovieResponse.self)
        
        let movieResults = try await httpClient.load(resource)
        nowPlayingMovies = movieResults.results
        
        
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
        let resource = Resource(url: Constants.Urls.singleMovie(movieId: movieId), method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef"), URLQueryItem(name: "append_to_response", value: "videos,credits")]), modelType: Movie.self)
        
        movie = try await httpClient.load(resource)
    }
    
    
    
    
}
