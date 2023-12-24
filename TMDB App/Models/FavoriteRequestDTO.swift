//
//  FavoriteRequestDTO.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/23/23.
//

import Foundation

struct FavoriteRequestDTO: Codable {
    let mediaType: String = "movie"
    let mediaID: Int
    let favorite: Bool = true

    enum CodingKeys: String, CodingKey {
        case mediaType = "media_type"
        case mediaID = "media_id"
        case favorite
    }
}

struct FavoriteResponseDTO: Codable {
    let success: Bool
    let statusCode: Int
    let statusMessage: String

    enum CodingKeys: String, CodingKey {
        case success
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}
