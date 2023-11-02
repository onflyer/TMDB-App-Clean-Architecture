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
    
    
    let httpClient = HTTPClient()
   
    
    
    func fetchNowPlayingMovies() async throws {
        let resource = Resource(url: Constants.Urls.nowPlaying,method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef")]), modelType: MovieResponse.self)
        
        let movieResults = try await httpClient.load(resource)
        nowPlayingMovies = movieResults.results
        
        
    }
    
    func fetchSingleMovie(movieId: Int) async throws {
        let resource = Resource(url: Constants.Urls.singleMovie(movieId: movieId), method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef"), URLQueryItem(name: "append_to_response", value: "videos,credits")]), modelType: Movie.self)
        
        movie = try await httpClient.load(resource)
    }
    
    
    
    
}
