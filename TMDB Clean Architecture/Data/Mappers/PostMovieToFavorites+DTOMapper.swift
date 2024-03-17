//
//  PostMovieToFavorites+DTOMapper.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/17/24.
//

import Foundation

extension PostMovieToFavoritesRequestEntity : DTOMapper {
    func toCodable() -> PostMovieToFavoritesRequestDTO {
        return PostMovieToFavoritesRequestDTO(mediaID: mediaID)
    }
}

extension PostMovieToFavoritesResponseDTO: DomainMapper {
    func toDomain() -> PostMovieToFavoritesResponseEntity {
        return PostMovieToFavoritesResponseEntity(success: success, statusCode: statusCode, statusMessage: statusMessage)
    }
}
