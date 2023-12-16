//
//  ImageRetriever.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/16/23.
//

import Foundation

struct ImageRetriever {
    
    func fetch(_ imgUrl: String) async throws -> Data {
        guard let url = URL(string: imgUrl) else {
            throw NetworkError.invalidResponse
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
