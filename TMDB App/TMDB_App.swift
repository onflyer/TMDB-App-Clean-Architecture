//
//  TMDB_AppApp.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 10/21/23.
//

import SwiftUI

@main
struct TMDB_App: App {
    
    static func main() async throws {
        let baseUrl = URL(string: "https://api.themoviedb.org/3/movie/now_playing")
        let url = baseUrl?.appending(queryItems: [URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef")])
        var request = URLRequest(url: url!)
    
        

        let (data, _ ) = try! await URLSession.shared.data(for: request)

        let response = try! JSONDecoder().decode(MovieResponse.self, from: data)
        
        print(response)
    }

    
    @StateObject private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabViewScreen()
                .environmentObject(ViewModel())
        }
    }
}
