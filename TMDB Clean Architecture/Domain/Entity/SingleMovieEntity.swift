//
//  SingleMovie.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/11/24.
//

import Foundation

struct SingleMovieEntity: Identifiable {
    let adult: Bool?
    let backdrop_path: String?
    let budget: Int?
    let genres: [Genre1]?
    let homepage: String?
    let id: Int?
    let imdb_id, original_language, original_title, overview: String?
    let popularity: Double?
    let poster_path: String?
    let release_date: String?
    let revenue, runtime: Int?
    let status, tagline, title: String?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?
    let videos: MovieVideoResponse1?
    let credits: Credits1?
    
    init(adult: Bool?, backdrop_path: String?, budget: Int?, genres: [Genre1]?, homepage: String?, id: Int?, imdb_id: String?, original_language: String?, original_title: String?, overview: String?, popularity: Double?, poster_path: String?, release_date: String?, revenue: Int?, runtime: Int?, status: String?, tagline: String?, title: String?, video: Bool?, vote_average: Double?, vote_count: Int?, videos: MovieVideoResponse1?, credits: Credits1?) {
        self.adult = adult
        self.backdrop_path = backdrop_path
        self.budget = budget
        self.genres = genres
        self.homepage = homepage
        self.id = id
        self.imdb_id = imdb_id
        self.original_language = original_language
        self.original_title = original_title
        self.overview = overview
        self.popularity = popularity
        self.poster_path = poster_path
        self.release_date = release_date
        self.revenue = revenue
        self.runtime = runtime
        self.status = status
        self.tagline = tagline
        self.title = title
        self.video = video
        self.vote_average = vote_average
        self.vote_count = vote_count
        self.videos = videos
        self.credits = credits
    }
    
    static func dummySingleMovie() -> SingleMovieEntity {
        return SingleMovieEntity(adult: false, backdrop_path: "/vimaZK2bkJlePnZ1yV5eKYpQkzF.jpg", budget: 15000000, genres: [Genre1(id: 14, name: "Drama")], homepage: "homepage", id: 14, imdb_id: "tt0169547", original_language: "en", original_title: "American Beauty", overview: "Lester Burnham, a depressed suburban father in a mid-life crisis, decides to turn his hectic life around after developing an infatuation with his daughter's attractive friend.", popularity: 34.92, poster_path: "/wby9315QzVKdW9BonAefg8jGTTb.jpg", release_date: "1999-09-15", revenue: 356296601, runtime: 122, status: "Released", tagline: "Look closer.", title: "American Beauty", video: false, vote_average: 8.02, vote_count: 11379, videos: MovieVideoResponse1(results: [MovieVideo1(name: "American Beauty (1999) Trailer 2", key: "IJM3cZlqwlA", site: "YouTube", id: "5fd7d94362f3350040ffc18b")]), credits: Credits1(cast: [Cast1(adult: false, gender: 2, id: 1979, known_for_department: "Acting", name: "Kevin Spacey", original_name: "Kevin Spacey", popularity: 15.124, profile_path: "/dlVRkUYKyZdJ39AN55cY1LoyXAP.jpg", cast_id: 6, character: "Lester Burnham", credit_id: "52fe420ec3a36847f80007db", order: 0, department: "Directing", job: "Writer")], crew: [Cast1(adult: false, gender: 2, id: 153, known_for_department: "Sound", name: "Thomas Newman", original_name: "Thomas Newman", popularity: 2.721, profile_path: "/j8rIiOSdBjtDL5vji8m5BtChZou.jpg", cast_id: 6, character: "Lester Burnham", credit_id: "52fe420ec3a36847f80007db", order: 0, department: "Sound", job: "Original Music Composer")]))
    }
    
    }



// MARK: - Credits
struct Credits1 {
    let cast, crew: [Cast1]
    
}

// MARK: - Cast
struct Cast1: Identifiable {
    let adult: Bool
    let gender, id: Int
    let known_for_department, name, original_name: String
    let popularity: Double
    let profile_path: String?
    let cast_id: Int?
    let character: String?
    let credit_id: String
    let order: Int?
    let department, job: String?
}

// MARK: - Genre
struct Genre1: Identifiable {
    let id: Int
    let name: String
}

// MARK: - Videos
struct MovieVideoResponse1 {
    let results: [MovieVideo1]
}

// MARK: - Result
struct MovieVideo1: Identifiable {
    let name, key: String
    let site: String
    let id: String
}

