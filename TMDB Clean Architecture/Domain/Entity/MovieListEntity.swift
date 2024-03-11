//
//  BaseResponse.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/11/24.
//

import Foundation

struct MovieListEntity {
    let page: Int
    let results: [MovieEntity]?
    let total_pages: Int
    let total_results: Int
}



