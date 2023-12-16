//
//  SingleMovieResponse.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/19/23.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let singleMovieResponse = try? JSONDecoder().decode(SingleMovieResponse.self, from: jsonData)

import Foundation

// MARK: - SingleMovieResponse
struct SingleMovieResponse: Codable, Identifiable {
    let adult: Bool
    let backdropPath: String
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdbID, originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let revenue, runtime: Int
    let status, tagline, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    let videos: MovieVideoResponse
    let credits: Credits

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
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath )")!
    }
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath )")!
    }
    var posterURLString: String {
        return "https://image.tmdb.org/t/p/w500\(posterPath )"
    }
    var backdropURLString: String {
        return "https://image.tmdb.org/t/p/w500\(backdropPath )"
    }
    
    static private let yearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    static private let durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
    
    var ratingText: String {
        let rating = Int(voteAverage)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "★"
        }
        return ratingText
    }
    var scoreText: String {
        guard ratingText.count > 0 else {
            return "n/a"
        }
        return "\(ratingText.count)/10"
    }
    
    var yearText: String {
        guard let date = SingleMovieResponse.dateFormatter.date(from: releaseDate) else {
            return "n/a"
        }
        return SingleMovieResponse.yearFormatter.string(from: date)
    }
    
    var durationText: String {
        
    return SingleMovieResponse.durationFormatter.string(from: TimeInterval(runtime) * 60) ?? "n/a"
        }
    }

// MARK: - Credits
struct Credits: Codable {
    let cast, crew: [Cast]
    
    var directors: [Cast] {
        crew.filter { $0.job?.lowercased() == "director" }
    }
    
    var producers: [Cast] {
        crew.filter { $0.job?.lowercased() == "producer" }
    }
    
    var screenWriters: [Cast] {
        crew.filter { $0.job?.lowercased() == "writer" }
    }
}

// MARK: - Cast
struct Cast: Codable, Identifiable {
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
struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}

// MARK: - Videos
struct MovieVideoResponse: Codable {
    let results: [MovieVideo]
}

// MARK: - Result
struct MovieVideo: Codable, Identifiable {
    let name, key: String
    let site: String
    let id: String
    
    var youtubeURL: URL? {
        guard site == "YouTube" else {
            return nil
        }
        return URL(string: "https://youtube.com/watch?v=\(key)")
    }
    enum CodingKeys: String, CodingKey {
        case name, key, site
        case id
    }
    
}
