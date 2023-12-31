//
//  AddFavorite.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/23/23.
//

import Foundation

struct AddFavoriteMovieDTO: Codable {
    let mediaType: String
    let mediaID: Int
    let favorite: Bool

    enum CodingKeys: String, CodingKey {
        case mediaType = "media_type"
        case mediaID = "media_id"
        case favorite
    }
}
