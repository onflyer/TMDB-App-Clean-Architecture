//
//  Movie+Stubs.swift
//  TMDB Movies - Apple's MV Architecture
//
//  Created by Aleksandar Milidrag on 10/5/23.
//

import Foundation


extension Movie {
    
    static var stubbedMovies: [Movie] {
        let response: MovieResponse? = try? Bundle.main.loadFromBundle(filename: "NowPlaying")
        return response!.results
    }
    
    static var stubbedMovie: Movie {
        stubbedMovies[0]
    }
    
    static func testofflineResponse() async throws {
        let url = Bundle.main.url(forResource: "NowPlaying", withExtension: "json")
        let data = try? Data(contentsOf: url!)
        let response = try! JSONDecoder().decode(MovieResponse.self, from: data!)
        
        print(response)
    }
    
}

extension Bundle {
    
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
//        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(Movie.dateFormatter)
        return jsonDecoder
    }()
    
    func loadFromBundle<D: Decodable>(filename: String) throws -> D? {
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        let jsonDecoder = Bundle.jsonDecoder
        let decodedModel = try jsonDecoder.decode(D.self, from: data)
        print(decodedModel)
        return decodedModel
    }
}

