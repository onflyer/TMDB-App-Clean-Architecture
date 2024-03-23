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
        state = .loading
        let result = await getMovieByIdUseCase.execute(movieId: movieId)
        
        switch result {
        case .success(let data):
            singleMovie = data
            state = .success
        case .failure(let error):
            print(error)
            state = .error(error.localizedDescription)
        }
    }
    
}
