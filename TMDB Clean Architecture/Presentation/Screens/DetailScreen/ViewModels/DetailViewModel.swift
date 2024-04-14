//
//  DetailViewModel.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/21/24.
//

import Foundation

@MainActor
final class DetailViewModel: ViewModel {
    // MARK: - Dependencies -
    private let getMovieByIdUseCase: any GetMovieByIdUseCase
    
   
    
   // MARK: - Properties -
    @Published var singleMovie: SingleMovieEntity? = nil
    
    // MARK: - Init -
    init(getMovieByIdUseCase: any GetMovieByIdUseCase ) {
        self.getMovieByIdUseCase = getMovieByIdUseCase
    }
}


extension DetailViewModel {
    func loadMovieById(movieId: Int) async {
        
        do {
            state = .loading
            let result = try await getMovieByIdUseCase.execute(movieId: movieId)
            singleMovie = result
            state = .success
        } catch {
            print(error)
            state = .error(error.localizedDescription)
        }
    }
}

