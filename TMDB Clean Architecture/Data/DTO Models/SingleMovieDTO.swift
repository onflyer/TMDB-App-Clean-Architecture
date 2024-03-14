//
//  SingleMovieDTO.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/14/24.
//

import Foundation


struct SingleMovieDTO: Identifiable, Codable {
    let adult: Bool?
    let backdropPath: String?
    let budget: Int?
    let genres: [GenreDTO]?
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
    let videos: MovieVideoResponseDTO?
    let credits: CreditsDTO?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue, runtime
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case videos, credits
    }
}

struct CreditsDTO: Codable {
    let cast, crew: [CastDTO]
    
}

// MARK: - Cast
struct CastDTO: Identifiable, Codable {
    let adult: Bool
    let gender, id: Int
    let knownForDepartment, name, originalName: String
    let popularity: Double
    let profilePath: String?
    let castID: Int?
    let character: String?
    let creditID: String
    let order: Int?
    let department, job: String?
    
    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
}

// MARK: - Genre
struct GenreDTO: Identifiable, Codable {
    let id: Int
    let name: String
}

// MARK: - Videos
struct MovieVideoResponseDTO: Codable {
    let results: [MovieVideoDTO]
}

// MARK: - Result
struct MovieVideoDTO: Identifiable, Codable {
    let name, key: String
    let site: String
    let id: String
}
