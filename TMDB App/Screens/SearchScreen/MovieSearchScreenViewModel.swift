//
//  MovieSearchScreenViewModel.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/17/23.
//

import Foundation
import Dependencies

@MainActor
final class MovieSearchScreenViewModel: ObservableObject {
    
    @Dependency(\.httpClient) var httpClient
    
    @Published var query = ""
    @Published var isLoading: Bool = false
    
    @Published var searchedMovies1: [Movie] = []

    
    func fetchSearchedMovie(query: String) async throws {
        let resource = Resource(url: Constants.Urls.searchURL, method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef"),URLQueryItem(name: "language", value: "en-US"),URLQueryItem(name: "include_adult", value: "true"),URLQueryItem(name: "region", value: "US"),URLQueryItem(name: "query", value: query)]), modelType: MovieResponse.self)
        
        let searchResults = try await httpClient.load(resource)
        searchedMovies1 = searchResults.results
    }
    
    func loadSearchedMovie(query: String) async throws {
       let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
       
       guard !query.isEmpty else {
           searchedMovies1.removeAll()
           return
       }
        isLoading = true
       do {
           try await self.fetchSearchedMovie(query: trimmedQuery)
       } catch {
           print(error)
       }
       isLoading = false
       
   }
    
    //    private var cancellables = Set<AnyCancellable>()
    //     func addSubscribers() {
    //
    //        $query
    //            .debounce(for: 0.3, scheduler: DispatchQueue.main)
    //            .sink { query in
    //                Task {
    //
    //                    try await self.search(query: query)
    //                }
    //            }
    //            .store(in: &cancellables)
    //    }
}
