//
//  FavoritesViewModel.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/21/24.
//

import Foundation

@MainActor
final class FavoritesViewModel: ViewModel {
    // MARK: - Dependencies -
    private let getFavoritesUseCase: any GetFavoritesUseCase
    private let deleteFavoriteMovieUseCase: any DeleteMovieFromFavoritesUseCase
    
   // MARK: - Properties -
    @Published var favoriteMovies: [MovieEntity] = []
    private var page = 1
    
    // MARK: - Init -
    init(getFavoritesUseCase: any GetFavoritesUseCase, deleteFavoriteMovieUseCase: any DeleteMovieFromFavoritesUseCase ) {
        self.getFavoritesUseCase = getFavoritesUseCase
        self.deleteFavoriteMovieUseCase = deleteFavoriteMovieUseCase
    }
}


extension FavoritesViewModel {
    func loadFavoriteMovies() async {
            state = .loading
            let result = await getFavoritesUseCase.execute(page: page)
            
            switch result {
            case .success(let data):
                favoriteMovies = data
                if favoriteMovies.isEmpty {
                    state = .empty
                } else {
                    state = .success
                }
            case .failure(let error):
                print(error)
                state = .error(error.localizedDescription)
            
        }
    }
    
    func deleteFromFavorites(movieId: Int) async {
        
        let result = await deleteFavoriteMovieUseCase.execute(mediaId: movieId)
        
        switch result {
        case .success(let response):
            state = .success
            print(response)
            
        case .failure(let error):
            print(error)
            state = .error(error.localizedDescription)
        }
        favoriteMovies = favoriteMovies.filter {
            $0.id != movieId
        }
    }
    
    func swipeToDelete(at offsets: IndexSet) {
        offsets.forEach { index in
            let favoriteMovie = self.favoriteMovies[index]
            Task {
                await deleteFromFavorites(movieId: favoriteMovie.id ?? 0 )
            }
            
        }
    }
}
