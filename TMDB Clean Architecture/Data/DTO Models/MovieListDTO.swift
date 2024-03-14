//
//  MovieListDTO.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/14/24.
//

import Foundation

struct MovieListDTO: Codable {
    
    let page: Int
    let results: [MovieDTO]?
    let totalPages: Int
    let totalResults: Int
    
        enum CodingKeys: String, CodingKey {
            case page
            case results
            case totalPages = "total_pages"
            case totalResults = "total_results"
        }
    }
    


