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
    let ratingText: String?
    let scoreText: String?

    
    static func dummyArrayMovie() -> [MovieEntity] {
        return [MovieEntity(adult: false, backdropPath: "https://image.tmdb.org/t/p/w500/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg", genreIDS: [
            27,
            9648
        ], id: 507089, originalTitle: "Five Nights at Freddy's", overview: "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems.", popularity: 1355.052, posterPath: "https://image.tmdb.org/t/p/w500/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg", releaseDate: "2023", title: "Five Nights at Freddy's", video: false, voteAverage: 7.964, voteCount: 2262, ratingText: "★★★★★★★", scoreText: "7/10"),MovieEntity(adult: false, backdropPath: "https://image.tmdb.org/t/p/w500/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg", genreIDS: [
            27,
            9648
        ], id: 507089, originalTitle: "Five Nights at Freddy's", overview: "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems.", popularity: 1355.052, posterPath: "https://image.tmdb.org/t/p/w500/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg", releaseDate: "2023-10-25", title: "Five Nights at Freddy's", video: false, voteAverage: 7.964, voteCount: 2262, ratingText: "★★★★★★★", scoreText: "7/10"),MovieEntity(adult: false, backdropPath: "https://image.tmdb.org/t/p/w500/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg", genreIDS: [
            27,
            9648
        ], id: 507089, originalTitle: "Five Nights at Freddy's", overview: "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems.", popularity: 1355.052, posterPath: "https://image.tmdb.org/t/p/w500/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg", releaseDate: "2023-10-25", title: "Five Nights at Freddy's", video: false, voteAverage: 7.964, voteCount: 2262, ratingText: "★★★★★★★", scoreText: "7/10"),MovieEntity(adult: false, backdropPath: "https://image.tmdb.org/t/p/w500/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg", genreIDS: [
            27,
            9648
        ], id: 507089, originalTitle: "Five Nights at Freddy's", overview: "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems.", popularity: 1355.052, posterPath: "https://image.tmdb.org/t/p/w500/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg", releaseDate: "2023-10-25", title: "Five Nights at Freddy's", video: false, voteAverage: 7.964, voteCount: 2262, ratingText: "★★★★★★★", scoreText: "7/10")]
    }
    
    
    static func dummyMovie() -> MovieEntity {
        return MovieEntity(adult: false, backdropPath: "https://image.tmdb.org/t/p/w500/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg", genreIDS: [
            27,
            9648
        ], id: 507089, originalTitle: "Five Nights at Freddy's", overview: "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems.", popularity: 1355.052, posterPath: "https://image.tmdb.org/t/p/w500/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg", releaseDate: "2023-10-25", title: "Five Nights at Freddy's", video: false, voteAverage: 7.964, voteCount: 2262, ratingText: "★★★★★★★", scoreText: "7/10")
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

extension MovieEntity {
   
    init (adult: Bool? = nil, backdropPath: String? = nil, genreIDS: [Int]? = nil, id: Int?, originalTitle: String? = nil, overview: String? = nil, popularity: Double? = nil, posterPath: String?, releaseDate: String? = nil, coreDataTitle: String?, video: Bool? = nil, voteAverage: Double? = nil, voteCount: Int? = nil, ratingText: String? = nil, scoreText: String? = nil) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIDS = genreIDS
        self.id = id
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = coreDataTitle
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.ratingText = ratingText
        self.scoreText = scoreText
    }
    
}
