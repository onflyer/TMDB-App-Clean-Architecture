////
////  MovieResponse.swift
////  TMDB App
////
////  Created by Aleksandar Milidrag on 10/21/23.
////
//
//import Foundation
//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: jsonData)
//
//
//// MARK: - MovieResponse
//struct MovieResponse: Codable {
////    let dates: Dates?
//    let page: Int
//    let results: [Movie]
//    let totalPages, totalResults: Int
//
//    enum CodingKeys: String, CodingKey {
////        case dates
//        case page, results
//        case totalPages = "total_pages"
//        case totalResults = "total_results"
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
////        self.dates = try container.decodeIfPresent(Dates.self, forKey: .dates)
//        self.page = try container.decode(Int.self, forKey: .page)
//        self.results = try container.decode([Movie].self, forKey: .results)
//        self.totalPages = try container.decode(Int.self, forKey: .totalPages)
//        self.totalResults = try container.decode(Int.self, forKey: .totalResults)
//    }
//}
//
//// MARK: - Dates
//struct Dates: Codable {
//    let maximum, minimum: String
//}
//
//// MARK: - Result
//struct Movie: Codable,Identifiable,Hashable {
//    
//    static func == (lhs: Movie, rhs: Movie) -> Bool {
//        lhs.id == rhs.id
//    }
//    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//    
//    let adult: Bool
//    let backdropPath: String
//    let genreIDS: [Int]
//    let id: Int
////    let originalLanguage: OriginalLanguage?
//    let originalTitle, overview: String
//    let popularity: Double
//    let posterPath, releaseDate, title: String
//    let video: Bool
//    let voteAverage: Double
//    let voteCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath = "backdrop_path"
//        case genreIDS = "genre_ids"
//        case id
////        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview, popularity
//        case posterPath = "poster_path"
//        case releaseDate = "release_date"
//        case title, video
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//    }
//    var posterURL: URL {
//        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath )")!
//    }
//    var backdropURL: URL {
//        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath )")!
//    }
//    var posterURLString: String {
//        return "https://image.tmdb.org/t/p/w500\(posterPath )"
//    }
//    var backdropURLString: String {
//        return "https://image.tmdb.org/t/p/w500\(backdropPath )"
//    }
//    var yearText: String {
//        guard let date = SingleMovieResponse.dateFormatter.date(from: releaseDate) else {
//            return "n/a"
//        }
//        return Movie.yearFormatter.string(from: date)
//    }
//    var ratingText: String {
//        let rating = Int(voteAverage)
//        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
//            return acc + "★"
//        }
//        return ratingText
//    }
//    var scoreText: String {
//        guard ratingText.count > 0 else {
//            return "n/a"
//        }
//        return "\(ratingText.count)/10"
//    }
//    static private let yearFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy"
//        return formatter
//    }()
//    
//    static let dateFormatter: DateFormatter = {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-mm-dd"
//        return dateFormatter
//    }()
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.adult = try container.decode(Bool.self, forKey: .adult)
//        self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath) ?? "No image present"
//        self.genreIDS = try container.decodeIfPresent([Int].self, forKey: .genreIDS) ?? []
//        self.id = try container.decode(Int.self, forKey: .id)
////        self.originalLanguage = try container.decodeIfPresent(OriginalLanguage.self, forKey: .originalLanguage)
//        self.originalTitle = try container.decode(String.self, forKey: .originalTitle)
//        self.overview = try container.decode(String.self, forKey: .overview)
//        self.popularity = try container.decodeIfPresent(Double.self, forKey: .popularity) ?? 1.0
//        self.posterPath = try container.decode(String.self, forKey: .posterPath)
//        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate) ?? "No release date"
//        self.title = try container.decode(String.self, forKey: .title)
//        self.video = try container.decodeIfPresent(Bool.self, forKey: .video) ?? false
//        self.voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage) ?? 1.0
//        self.voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount) ?? 1
//    }
//    
//}
//
////enum OriginalLanguage: String, Codable {
//////    case en = "en"
////    case ru = "en"
////    case uk = "uk"
////    case es = "es"
////    case fr = "fr"
////    case ja = "ja"
////    case hi = "hi"
////    case ko = "ko"
////    case it = "it"
////    case cn = "cn"
////
////}
//
