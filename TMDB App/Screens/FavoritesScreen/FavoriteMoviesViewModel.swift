////
////  FavoriteMoviesViewModel.swift
////  TMDB App
////
////  Created by Aleksandar Milidrag on 12/23/23.
////
//
//import Foundation
//
//@MainActor
//class FavoriteMoviesViewModel: ObservableObject {
//    
////    @Dependency(\.httpClient) var httpClient
//    
//    @Published var error: NetworkError?
//    @Published var hasError: Bool = false
//    
//    var page = 1
//    
//    @Published var favoriteMovies: [Movie] = []
//    
//    
//    func fetchFavoriteMovies() async throws {
//        let resource =  Resource(url: Constants.Urls.favoriteMovies, method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef"), URLQueryItem(name: "session_id", value: "954a0e7f7e9c282ade3daaab053db4e20c870209"),URLQueryItem(name: "page", value: String(page)),URLQueryItem(name: "language", value: "en-US"),URLQueryItem(name: "sort_by", value: "created_at.desc")]), modelType: MovieResponse.self)
//        
//        let favoriteResults = try await HTTPClient.shared.load(resource)
//         favoriteMovies = favoriteResults.results
//    }
//    
//    func loadFavoriteMovies() async {
//        do {
//            try await fetchFavoriteMovies()
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
//        favoriteMovies = favoriteMovies.filter {
//            $0.id != movieId
//        }
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
//            
//        }
//    }
//    
//     func swipeToDelete(at offsets: IndexSet) {
//        offsets.forEach { index in
//            let favoriteMovie = self.favoriteMovies[index]
//            Task {
//                await self.loadDeleteFavoriteMovie(movieId: favoriteMovie.id)
//            }
//        }
//    }
//}
