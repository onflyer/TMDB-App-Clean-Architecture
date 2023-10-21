//
//  Endpoint.swift
//  TMDB Movies - Apple's MV Architecture
//
//  Created by Aleksandar Milidrag on 10/6/23.
//

import Foundation

enum Endpoint: CaseIterable, Identifiable {
    
    var id: Self {
        return self
        }
    
    case nowPlaying
    case upcoming
    case topRated
    case popular
 
}

extension Endpoint {
    var fullPath: String {
        base + path
    }
    
}

private extension Endpoint {
    var base: String {
        "https://api.themoviedb.org/3"
    }
    
    var path: String {
        switch self {
        case .nowPlaying:
            return "/movie/now_playing"
        case .upcoming:
            return "/movie/upcoming"
        case .topRated:
            return "/movie/top_rated"
        case .popular:
            return "/movie/popular"
        }
    }
    
    var sortIndex: Int {
        switch self {
        case .nowPlaying:
            return 0
        case .upcoming:
            return 1
        case .topRated:
            return 2
        case .popular:
            return 3
        }
    }
}


