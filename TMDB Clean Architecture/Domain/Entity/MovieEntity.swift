//
//  Movie.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/11/24.
//

import Foundation


struct MovieEntity: Identifiable {
    
    let adult: Bool?
    let backdrop_path: String?
    let genre_ids: [Int]?
    let id: Int?
    let original_title, overview: String?
    let popularity: Double?
    let poster_path, release_date, title: String?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?
    
    init(adult: Bool?, backdrop_path: String?, genre_ids: [Int]?, id: Int?, original_title: String?, overview: String?, popularity: Double?, poster_path: String?, release_date: String?, title: String?, video: Bool?, vote_average: Double?, vote_count: Int?) {
        self.adult = adult
        self.backdrop_path = backdrop_path
        self.genre_ids = genre_ids
        self.id = id
        self.original_title = original_title
        self.overview = overview
        self.popularity = popularity
        self.poster_path = poster_path
        self.release_date = release_date
        self.title = title
        self.video = video
        self.vote_average = vote_average
        self.vote_count = vote_count
    }
    
    static func dummyMovie() -> MovieEntity {
        return MovieEntity(adult: false, backdrop_path: "/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg", genre_ids: [
            27,
            9648
        ], id: 507089, original_title: "Five Nights at Freddy's", overview: "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems.", popularity: 1355.052, poster_path: "/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg", release_date: "2023-10-25", title: "Five Nights at Freddy's", video: false, vote_average: 7.964, vote_count: 2262)
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
