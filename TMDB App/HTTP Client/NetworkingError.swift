//
//  NetworkingError.swift
//  TMDB Movies - Apple's MV Architecture
//
//  Created by Aleksandar Milidrag on 10/5/23.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case serverError(String)
    case decodingError
    case invalidResponse
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badRequest:
            return NSLocalizedString("Unable to perform request", comment: "badRequestError")
        case .serverError(let errorMesage):
            return NSLocalizedString(errorMesage, comment: "serverError")
        case .decodingError:
            return NSLocalizedString("Unable to decode successfully", comment: "decodingError")
        case .invalidResponse:
            return NSLocalizedString("Invalid response", comment: "invalidResponse")
        }
    }
}
