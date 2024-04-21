//
//  TMDB_AppApp.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 10/21/23.
//

import SwiftUI

@main
struct TMDB_App: App {
    
    init() {
        /// Injecting all dependencies
        Resolver.shared.injectModules()
    }

    var body: some Scene {
        WindowGroup {
          ContainerView()
                .preferredColorScheme(.dark)
        }
    }
}

//    static func main() {
//        let instance = DefaultFavoriteMoviesOfflineRepository(dataSource: DefaultFavoriteOfflineDataSource(dataStack: CoreDataStack()))
//       let result = instance.isFavorite(movie: MovieEntity(id: 414124, posterPath: "4211231", coreDataTitle: "SALKAAAA"))
////       let movies = instance.getFavorites()
//
//        print(result)
//    }

//        static func main() async {
//            let instance = DefaultFavoriteMoviesRepository(moviesDatasource: DefaultFavoriteMoviesDataSource(requestManager: DefaultRequestManager()))
//            let movies = await instance.deleteMovieFromFavorites(mediaId: 21)
//                print(movies)
//            }

//static func main() async {
//    let instance = DefaultMoviesRepository(moviesDatasource: DefaultMovieDataSource(requestManager: DefaultRequestManager()))
//    let movies = await instance.getPopularMovies(page: 3)
//    print(movies)
//}

//    static func main() async {
//        let instance = DefaultFavoriteMoviesRepository(moviesDatasource: DefaultFavoriteMoviesDataSource(requestManager: DefaultRequestManager()))
//        let movies = await instance.postMovieToFavorites(mediaId: 21)
//            print(movies)
//        }
    
    
    
//    static func main() async {
//        let instance = DefaultSearchMoviesRepository(moviesDatasource: DefaultSearchMoviesDataSource(requestManager: DefaultRequestManager()))
//        let movies = await instance.searchMovie(query: "fast")
//        print(movies)
//    }
    
//        static func main() async {
//            let instance = DefaultFavoriteMoviesRepository(moviesDatasource: DefaultFavoriteMoviesDataSource(requestManager: DefaultRequestManager()))
//            let movies = await instance.getFavoriteMovies(page: 1)
//            print(movies)
//        }
//
//    static func main() {
//        let data = AddFavoriteMovieDTO(mediaType: "type", mediaID: 12, favorite: false)
//        if let dictionary = data.dictionary {
//            print(dictionary)
//
//        }
//
//
//
//    }

//    static func main() async throws {
//        let baseUrl = URL(string: "https://api.themoviedb.org/3/account/20029223/favorite/movies")
//        let url = baseUrl?.appending(queryItems: [URLQueryItem(name: "session_id", value: "954a0e7f7e9c282ade3daaab053db4e20c870209"), URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef"),URLQueryItem(name: "page", value: String(1)),URLQueryItem(name: "language", value: "en-US")])
//        var request = URLRequest(url: url!)
//
//
//
//        let (data, _ ) = try! await URLSession.shared.data(for: request)
//
//        let response = try! JSONDecoder().decode(MovieListDTO.self, from: data)
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
