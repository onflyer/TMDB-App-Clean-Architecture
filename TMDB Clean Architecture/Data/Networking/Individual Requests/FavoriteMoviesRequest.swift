//
//  FavoriteMoviesRequest.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/17/24.
//

import Foundation

enum FavoriteMoviesRequest : RequestProtocol {
    
    case getFavoriteMovies(page: Int)
    
    var path: String {
        switch self {
        case .getFavoriteMovies:
            return "/3/account/20029223/favorite/movies"
        }
    }
    
    var urlParams: [String : String?] {
        switch self {
        case .getFavoriteMovies( let page):
            return ["session_id": "954a0e7f7e9c282ade3daaab053db4e20c870209","page": String(page), "language": "US", "sort_by": "created_at.desc"]
        }
    }
    
    var requestType: RequestType {
        .GET
    }
}

//let resource =  Resource(url: Constants.Urls.favoriteMovies, method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef"), URLQueryItem(name: "session_id", value: "954a0e7f7e9c282ade3daaab053db4e20c870209"),URLQueryItem(name: "page", value: String(page)),URLQueryItem(name: "language", value: "en-US"),URLQueryItem(name: "sort_by", value: "created_at.desc")]), modelType: MovieResponse.self)
