////
////  MovieDetailScreenViewModel.swift
////  TMDB App
////
////  Created by Aleksandar Milidrag on 12/17/23.
////
//
//import Foundation
//
//
//@MainActor
//final class MovieDetailScreenViewModel: ObservableObject {
//    
////    @Dependency(\.httpClient) var httpClient
//    
//    @Published var error: NetworkError?
//    @Published var hasError: Bool = false
//    
//    @Published var isLoading: Bool = false
//    @Published var movie: SingleMovieResponse? = nil
//    
//    
//    func fetchMovieById(movieId: Int) async throws {
//        let resource = Resource(url: Constants.Urls.singleMovie(movieId: movieId), method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef"), URLQueryItem(name: "append_to_response", value: "videos,credits")]), modelType: SingleMovieResponse.self)
//        
//        movie = try await HTTPClient.shared.load(resource)
//    }
//    
//    func loadMoviebyId(movieId: Int) async {
//        self.isLoading = true
//        do {
//            try await self.fetchMovieById(movieId: movieId)
//            self.isLoading = false
//        } catch {
//            print(error)
//            self.hasError = true
//            if let networkingError = error as? NetworkError {
//                self.error = networkingError
//            } else {
//                self.error = .custom(error: error)
//            }
//            
//        }
//    }
//    
//    func postToFavorites(movieId: Int) async throws {
//        
//        let data = FavoriteRequestDTO(mediaID: movieId)
//        
//        let resource = try Resource(url: Constants.Urls.postToFavorites, method: .post(JSONEncoder().encode(data), [URLQueryItem(name: "session_id", value: "954a0e7f7e9c282ade3daaab053db4e20c870209"), URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef")]), modelType: FavoriteResponseDTO.self)
//        print(resource)
//        
//        let newFavoriteMovie = try await HTTPClient.shared.load(resource)
//        print(newFavoriteMovie)
//    }
//    
//    func loadPostToFavorites(movieId: Int) async {
//        do {
//            try await self.postToFavorites(movieId: movieId)
//        } catch {
//            print(error)
//            self.hasError = true
//            if let networkingError = error as? NetworkError {
//                self.error = networkingError
//            } else {
//                self.error = .custom(error: error)
//            }
//        }
//    }
//    
//    func fetchDeleteFavoriteMovie(movieId: Int) async throws {
//        
//        let data = FavoriteDeleteRequestDTO(mediaID: movieId)
//        
//        let resource = try Resource(url: Constants.Urls.deleteFavoriteMovie, method: .post(JSONEncoder().encode(data), [URLQueryItem(name: "session_id", value: "954a0e7f7e9c282ade3daaab053db4e20c870209"), URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef")]), modelType: FavoriteResponseDTO.self)
//        
//        let deletedMovie = try await HTTPClient.shared.load(resource)
//        print(deletedMovie)
//        
//    }
//    
//    func loadDeleteFavoriteMovie(movieId: Int) async {
//        do {
//            try await fetchDeleteFavoriteMovie(movieId: movieId)
//        } catch {
//            print(error)
//            self.hasError = true
//            if let networkingError = error as? NetworkError {
//                self.error = networkingError
//            } else {
//                self.error = .custom(error: error)
//            }
//        }
//    }
//
//    
//    
//    
//}
