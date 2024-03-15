//
//  MovieDTO+DomainMapper.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/15/24.
//

import Foundation

extension MovieDTO: DomainMapper {
    func toDomain() -> MovieEntity {
        return MovieEntity(adult: adult, backdropPath: backdropURLString, genreIDS: genreIDS, id: id, originalTitle: originalTitle, overview: overview, popularity: popularity, posterPath: posterURLString, releaseDate: yearText, title: title, video: video, voteAverage: voteAverage, voteCount: voteCount,ratingText: ratingText, scoreText: scoreText)
    }
    
    
}
