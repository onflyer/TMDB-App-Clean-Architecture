//
//  DataParser.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/13/24.
//

import Foundation


protocol DataParserProtocol {
    func parse<T: Decodable>(data: Data) throws -> T
}

class DefaultDataParser: DataParserProtocol {
    private var jsonDecoder: JSONDecoder
    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
//        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    func parse<T: Decodable>(data: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
}

