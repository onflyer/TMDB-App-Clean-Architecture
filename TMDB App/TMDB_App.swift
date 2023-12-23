//
//  TMDB_AppApp.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 10/21/23.
//

import SwiftUI

@main
struct TMDB_App: App {

//    static func main() async throws {
//        let baseUrl = URL(string: "https://api.themoviedb.org/3/movie/popular")
//        let url = baseUrl?.appending(queryItems: [URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef")])
//        var request = URLRequest(url: url!)
//    
//        
//
//        let (data, _ ) = try! await URLSession.shared.data(for: request)
//
//        let response = try! JSONDecoder().decode(MovieResponse.self, from: data)
//        
//        print(response)
//    }
    
    
//    static func main() async throws {
//        let baseUrl = URL(string: "https://api.themoviedb.org/3/movie/14?append_to_response=videos,credits")
//        let url = baseUrl?.appending(queryItems: [URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef")])
//        var request = URLRequest(url: url!)
//        
//        
//        
//        let (data, _ ) = try! await URLSession.shared.data(for: request)
//        
//        let response = try! JSONDecoder().decode(SingleMovieResponse.self, from: data)
//        
//        print(response)
//    }


//    static func main() async throws {
//        let url = Bundle.main.url(forResource: "NowPlaying", withExtension: "json")
//        let data = try? Data(contentsOf: url!)
//        let response = try! JSONDecoder().decode(MovieResponse.self, from: data!)
//        
//        print(response)
//    }
    
//    static func main() async throws {
//        let url = Bundle.main.url(forResource: "SingleMovieResponse", withExtension: "json")
//        let data = try? Data(contentsOf: url!)
//        let response = try! JSONDecoder().decode(SingleMovieResponse.self, from: data!)
//        
//        print(response)
//    }
      
    
    var body: some Scene {
        WindowGroup {
            ContentView1()
        }
    }
}
