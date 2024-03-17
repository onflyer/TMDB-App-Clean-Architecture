//
//  PostMovieToFavoritesEntity.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/17/24.
//

import Foundation

struct PostMovieToFavoritesRequestEntity {
    let mediaType: String = "movie"
    let mediaID: Int
    let favorite: Bool = true
}
