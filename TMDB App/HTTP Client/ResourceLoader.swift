//
//  RecourceLoader.swift
//  TMDB Movies - Apple's MV Architecture
//
//  Created by Aleksandar Milidrag on 10/5/23.
//

import Foundation

struct Resource <T:Codable> {
    let url: URL
    var method: HTTPMethod = .get([])
    var modelType: T.Type
}


