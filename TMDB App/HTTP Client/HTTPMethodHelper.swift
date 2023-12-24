//
//  HTTPMethodHelper.swift
//  TMDB Movies - Apple's MV Architecture
//
//  Created by Aleksandar Milidrag on 10/5/23.
//

import Foundation

enum HTTPMethod {
    case get([URLQueryItem])
    case post(Data?, [URLQueryItem])
    case delete
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .delete:
            return "DELETE"
        }
    }
}
