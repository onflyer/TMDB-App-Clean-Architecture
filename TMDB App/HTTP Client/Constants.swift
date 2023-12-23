//
//  Constants.swift
//  TMDB Movies - Apple's MV Architecture
//
//  Created by Aleksandar Milidrag on 10/5/23.
//

import Foundation

struct Constants {
    
    private static let baseUrl = "https://api.themoviedb.org/3"
    
    struct Urls {
        static let nowPlaying = URL(string: "\(baseUrl)/movie/now_playing")!
        static let upcoming = URL(string: "\(baseUrl)/movie/upcoming")!
        static let topRated = URL(string: "\(baseUrl)/movie/top_rated")!
        static let popular = URL(string: "\(baseUrl)/movie/popular")!
        static func singleMovie(movieId: Int) -> URL {
            return URL(string: "\(baseUrl)/movie/\(movieId)")!
        }
        static let searchURL = URL(string: "\(baseUrl)/search/movie")!
        static let fetchRequestToken = URL(string: "https://api.themoviedb.org/3/authentication/token/new")!
        static let validateRequestToken = URL(string: "https://www.themoviedb.org/authenticate")!
        static let sessionId = URL(string: "https://api.themoviedb.org/3/authentication/session/new?api_key=89e4bae37305d94ef67db0a32d6e79ef")!
    }
}
