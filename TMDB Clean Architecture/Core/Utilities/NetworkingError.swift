//
//  NetworkingError.swift
//  TMDB Movies - Apple's MV Architecture
//
//  Created by Aleksandar Milidrag on 10/5/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case badRequest
    case serverError(String)
    case decodingError
    case invalidResponse
    case invalidStatusCode(statusCode: Int)
    case custom(error: Error)
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
        case .invalidStatusCode(statusCode: let statusCode):
            return NSLocalizedString("Status code falls in the wrong range: \(statusCode)", comment: "invalidStatusCode")
        case .custom(error: let error):
            return NSLocalizedString("Something went wrong \(error)", comment: "custom")
        case .invalidURL:
            return NSLocalizedString("URL string is malformed", comment: "invalidURL")
        }
    }
}
