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
    private let postMovieToFavoritesUseCase: any PostMovieToFavoritesUseCase
    private let deleteMovieFromFavoriesUseCase: any DeleteMovieFromFavoritesUseCase
    private let getFavoritesUseCase: any GetFavoritesUseCase
    
   // MARK: - Properties -
    @Published var singleMovie: SingleMovieEntity? = nil
    
    // MARK: - Init -
    init(getMovieByIdUseCase: any GetMovieByIdUseCase, postMovieToFavoritesUseCase: any PostMovieToFavoritesUseCase, deleteMovieFromFavoriesUseCase: any DeleteMovieFromFavoritesUseCase, getFavoritesUseCase: any GetFavoritesUseCase ) {
        self.getMovieByIdUseCase = getMovieByIdUseCase
        self.postMovieToFavoritesUseCase = postMovieToFavoritesUseCase
        self.deleteMovieFromFavoriesUseCase = deleteMovieFromFavoriesUseCase
        self.getFavoritesUseCase = getFavoritesUseCase
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
    
    func addToFavorites(movieId: Int) async {
        let result = await postMovieToFavoritesUseCase.execute(mediaId: movieId)
        
        switch result {
        case .success(let response):
            state = .success
            print(response)
        
        case .failure(let error):
            print(error)
            state = .error(error.localizedDescription)
        }
    }
    
    func deleteFromFavorites(movieId: Int) async {
        
        let result = await deleteMovieFromFavoriesUseCase.execute(mediaId: movieId)
        
        switch result {
        case .success(let response):
            state = .success
            print(response)
            
        case .failure(let error):
            print(error)
            state = .error(error.localizedDescription)
        }
    }
    
    
}
