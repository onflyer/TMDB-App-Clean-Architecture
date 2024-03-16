//
//  MoviesRequest.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/14/24.
//

import Foundation

enum MoviesRequest: RequestProtocol {
    
    case getNowPlayingMovies
    case getUpcomingMovies
    case getTopRatedMovies
    case getPopularMovies
    
    var requestType: RequestType {
        .GET
    }
    
    var path: String {
        switch self {
        case .getNowPlayingMovies:
           return "/3/movie/now_playing"
        case .getUpcomingMovies:
           return "/3/movie/upcoming"
        case .getTopRatedMovies:
           return "/3/movie/top_rated"
        case .getPopularMovies:
           return "/3/movie/popular"
        }
    }
        
    var headers: [String : String] {
        switch self {
        case .getNowPlayingMovies:
            return [:]
        case .getUpcomingMovies:
            return [:]
        case .getTopRatedMovies:
            return [:]
        case .getPopularMovies:
            return [:]
        }
    }
}
 

    //MARK: HEADERS FOR POST FAVORITE
//return ["content-type": "application/json", "accept": "application/json", "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4OWU0YmFlMzczMDVkOTRlZjY3ZGIwYTMyZDZlNzllZiIsInN1YiI6IjY0OGVmNWE0NDJiZjAxMDBhZTMxZTM2YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7PAEwgGiWHGXPoGblvW0i-SHZQAqL2UhOmQ1zwoSvVM"]
