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
    }
}
