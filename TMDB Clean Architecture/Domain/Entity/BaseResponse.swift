//
//  BaseResponse.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/11/24.
//

import Foundation

struct BaseResponse {
    let page: Int
    let results: [Movie1]?
    let total_pages: Int
    let total_results: Int
}



//struct MovieResponse: Codable {
//    let dates: Dates?
//    let page: Int
//    let results: [Movie]
//    let totalPages, totalResults: Int
//
//    enum CodingKeys: String, CodingKey {
//        case dates, page, results
//        case totalPages = "total_pages"
//        case totalResults = "total_results"
//    }
//    struct Dates: Codable {
//        let maximum, minimum: String
//    }
