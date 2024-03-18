//
//  RequestProtocol.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/12/24.
//

import Foundation

protocol RequestProtocol {
    var path: String { get }
    var requestType: RequestType { get }
    var headers: [String: String] { get }
    var params: [String: Any] { get }
    var urlParams: [String: String?] { get }
}

extension RequestProtocol {
    var host: String {
        return APIConstants.baseUrl
    }

    var params: [String: Any] {
        [:]
    }

    var urlParams: [String: String?] {
        [:]
    }

    var headers: [String: String] {
        [:]
    }

    func request() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path

        let timeStamp = "\(Date().timeIntervalSince1970)"

        /// Add default query params
        var queryParamsList: [URLQueryItem] = [
            URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef"),
        ]

        if !urlParams.isEmpty {
            queryParamsList.append(contentsOf: urlParams.map { URLQueryItem(name: $0, value: $1) })
        }

        components.queryItems = queryParamsList

        guard let url = components.url else {
            throw  NetworkError.invalidURL
            
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue

        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
       print("🚀 [REQUEST] [\(requestType.rawValue)] \(urlRequest), \(timeStamp)")
        return urlRequest
    }
}
