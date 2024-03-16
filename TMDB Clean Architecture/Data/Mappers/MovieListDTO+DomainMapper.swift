//
//  MovieListDTO+DomainMapper.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/16/24.
//

import Foundation

extension MovieListDTO: DomainMapper {
    func toDomain() -> MovieListEntity {
        return MovieListEntity(page: page, results: results?.compactMap({
            $0.toDomain()
        }), totalPages: totalPages, totalResults: totalResults)
    }
}
