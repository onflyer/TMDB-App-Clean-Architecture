//
//  NetworkingService.swift
//  TMDB Movies - Apple's MV Architecture
//
//  Created by Aleksandar Milidrag on 10/5/23.
//

import Foundation
import UIKit

struct HTTPClient {
    
    func load<T:Codable> (_ resource: Resource<T>) async throws -> T {
        var request = URLRequest(url: resource.url)
        
        switch resource.method {
            
        case .get(let queryItems):
            var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems
            
            guard let url = components?.url else {
                throw NetworkError.badRequest
            }
            
            request = URLRequest(url: url)
            
        case .post(let data, let queryItems):
            var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems
            request.httpMethod = resource.method.name
            request.setValue("application/json", forHTTPHeaderField: "content-type")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            request.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4OWU0YmFlMzczMDVkOTRlZjY3ZGIwYTMyZDZlNzllZiIsInN1YiI6IjY0OGVmNWE0NDJiZjAxMDBhZTMxZTM2YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7PAEwgGiWHGXPoGblvW0i-SHZQAqL2UhOmQ1zwoSvVM", forHTTPHeaderField: "Authorization")
            request.httpBody = data
           

            
        case .delete:
            request.httpMethod = resource.method.name
            
        }
      
        
        let configuration = URLSessionConfiguration.default
        
        let session = URLSession(configuration: configuration)
        
        let (data, response) = try await session.data(for: request)
        
        guard let _ = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        
        guard let result = try? JSONDecoder().decode(resource.modelType, from: data) else {
            throw NetworkError.decodingError
        }
        
        return result
    }
    
//    static func testResponse() async throws {
//        let baseUrl = URL(string: "https://api.themoviedb.org/3/movie/now_playing")
//        let url = baseUrl?.appending(queryItems: [URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef")])
//        let request = URLRequest(url: url!)
//    
//        
//
//        let (data, _ ) = try! await URLSession.shared.data(for: request)
//
//        let response = try! JSONDecoder().decode(MovieResponse.self, from: data)
//        
//        print(response)
//    }
}
