//
//  SearchViewModel.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/21/24.
//

import Foundation

@MainActor
final class SearchViewModel: ViewModel {
    // MARK: - Dependencies -
    private let searchMovieUseCase: any SearchMovieUseCase
    
   // MARK: - Properties -
    @Published var query = ""
    @Published var searchedMovies: [MovieEntity] = []
    
    // MARK: - Init -
    init(searchMovieUseCase: any SearchMovieUseCase) {
        self.searchMovieUseCase = searchMovieUseCase
    }
}


extension SearchViewModel {
    func loadSearchedMovies() async {
        state = .empty
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !query.isEmpty else {
            searchedMovies.removeAll()
            return
        }
        state = .loading
        let result = await searchMovieUseCase.execute(query: trimmedQuery)
        
        switch result {
        case .success(let data):
            searchedMovies = data
            state = .success
            
        case .failure(let error):
            print(error)
            state = .error(error.localizedDescription)
        }
    }
}
