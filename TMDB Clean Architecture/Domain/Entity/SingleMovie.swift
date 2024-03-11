//
//  SingleMovie.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/11/24.
//

import Foundation

struct SingleMovie: Identifiable {
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
struct Genre1: Codable, Identifiable {
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

