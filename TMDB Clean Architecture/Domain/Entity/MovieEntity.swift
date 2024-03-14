//
//  Movie.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/11/24.
//

import Foundation


struct MovieEntity: Identifiable {
    
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    
    
    static func dummyMovie() -> MovieEntity {
        return MovieEntity(adult: false, backdropPath: "/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg", genreIDS: [
            27,
            9648
        ], id: 507089, originalTitle: "Five Nights at Freddy's", overview: "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems.", popularity: 1355.052, posterPath: "/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg", releaseDate: "2023-10-25", title: "Five Nights at Freddy's", video: false, voteAverage: 7.964, voteCount: 2262)
    }
    
}
    
    
extension MovieEntity: Hashable {
    static func == (lhs: MovieEntity, rhs: MovieEntity) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
