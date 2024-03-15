//
//  SingleMovie.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/11/24.
//

import Foundation

struct SingleMovieEntity: Identifiable {
    let adult: Bool?
    let backdropPath: String?
    let budget: Int?
    let genres: [GenreEntity]?
    let homepage: String?
    let id: Int?
    let imdbID, originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let revenue, runtime: Int?
    let status, tagline, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let ratingtext: String?
    let scoreText: String?
    let durationText: String?
    let videos: MovieVideoResponseEntity?
    let credits: CreditsEntity?
    
    
    
    static func dummySingleMovie() -> SingleMovieEntity {
        return SingleMovieEntity(adult: false, backdropPath: "/vimaZK2bkJlePnZ1yV5eKYpQkzF.jpg", budget: 15000000, genres: [GenreEntity(id: 14, name: "Drama")], homepage: "homepage", id: 14, imdbID: "tt0169547", originalLanguage: "en", originalTitle: "American Beauty", overview: "Lester Burnham, a depressed suburban father in a mid-life crisis, decides to turn his hectic life around after developing an infatuation with his daughter's attractive friend.", popularity: 34.92, posterPath: "/wby9315QzVKdW9BonAefg8jGTTb.jpg", releaseDate: "1999-09-15", revenue: 356296601, runtime: 122, status: "Released", tagline: "Look closer.", title: "American Beauty", video: false, voteAverage: 8.02, voteCount: 11379,ratingtext: "★★★★★★★", scoreText: "8/10",durationText: "n/a", videos: MovieVideoResponseEntity(results: [MovieVideoEntity(name: "American Beauty (1999) Trailer 2", key: "IJM3cZlqwlA", site: "YouTube", id: "5fd7d94362f3350040ffc18b")]), credits: CreditsEntity(cast: [CastEntity(adult: false, gender: 2, id: 1979, known_for_department: "Acting", name: "Kevin Spacey", original_name: "Kevin Spacey", popularity: 15.124, profile_path: "/dlVRkUYKyZdJ39AN55cY1LoyXAP.jpg", cast_id: 6, character: "Lester Burnham", credit_id: "52fe420ec3a36847f80007db", order: 0, department: "Directing", job: "Writer")], crew: [CastEntity(adult: false, gender: 2, id: 153, known_for_department: "Sound", name: "Thomas Newman", original_name: "Thomas Newman", popularity: 2.721, profile_path: "/j8rIiOSdBjtDL5vji8m5BtChZou.jpg", cast_id: 6, character: "Lester Burnham", credit_id: "52fe420ec3a36847f80007db", order: 0, department: "Sound", job: "Original Music Composer")]))
    }
    
    }



// MARK: - Credits
struct CreditsEntity {
    let cast, crew: [CastEntity]?
    
}

// MARK: - Cast
struct CastEntity: Identifiable {
    let adult: Bool?
    let gender, id: Int?
    let known_for_department, name, original_name: String?
    let popularity: Double?
    let profile_path: String?
    let cast_id: Int?
    let character: String?
    let credit_id: String?
    let order: Int?
    let department, job: String?
}

// MARK: - Genre
struct GenreEntity: Identifiable {
    let id: Int?
    let name: String?
}

// MARK: - Videos
struct MovieVideoResponseEntity {
    let results: [MovieVideoEntity]?
}

// MARK: - Result
struct MovieVideoEntity: Identifiable {
    let name, key: String?
    let site: String?
    let id: String?
}

