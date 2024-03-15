//
//  MovieDTO+DomainMapper.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/15/24.
//

import Foundation

extension MovieDTO: DomainMapper {
    func toDomain() -> MovieEntity {
        return MovieEntity(adult: <#T##Bool?#>, backdropPath: <#T##String?#>, genreIDS: <#T##[Int]?#>, id: <#T##Int?#>, originalTitle: <#T##String?#>, overview: <#T##String?#>, popularity: <#T##Double?#>, posterPath: <#T##String?#>, releaseDate: <#T##String?#>, title: <#T##String?#>, video: <#T##Bool?#>, voteAverage: <#T##Double?#>, voteCount: <#T##Int?#>)
    }
    
    
}
