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
    private let postMovieToFavoritesUseCase: any PostMovieToFavoritesUseCase
    private let deleteFavoriteMovieUseCase: any DeleteMovieFromFavoritesUseCase
    private let getFavoritesOfflineUseCase: GetFavoritesOfflineUseCase
    private let addFavoriteOfflineUseCase: AddFavoriteOfflineUseCase
    private let checkFavoriteOfflineUseCase: CheckFavoriteOfflineUseCase
    private let removeFavoriteOfflineUseCase: RemoveFavoriteOfflineUseCase
    
   // MARK: - Properties -
    @Published var favoriteMovies: [MovieEntity] = []
    @Published var coreDataFavorites: [MovieEntity] = []
    private var page = 1
    @Published var isFavorite: Bool = false
    
    
    // MARK: - Init -
    init(getFavoritesUseCase: any GetFavoritesUseCase, deleteFavoriteMovieUseCase: any DeleteMovieFromFavoritesUseCase,postMovieToFavoritesUseCase: any PostMovieToFavoritesUseCase,getFavoritesOfflineUseCase: GetFavoritesOfflineUseCase, addFavoriteOfflineUseCase: AddFavoriteOfflineUseCase, checkFavoriteOfflineUseCase: CheckFavoriteOfflineUseCase, removeFavoriteOfflineUseCase: RemoveFavoriteOfflineUseCase) {
        self.getFavoritesUseCase = getFavoritesUseCase
        self.deleteFavoriteMovieUseCase = deleteFavoriteMovieUseCase
        self.postMovieToFavoritesUseCase = postMovieToFavoritesUseCase
        self.getFavoritesOfflineUseCase = getFavoritesOfflineUseCase
        self.addFavoriteOfflineUseCase = addFavoriteOfflineUseCase
        self.checkFavoriteOfflineUseCase = checkFavoriteOfflineUseCase
        self.removeFavoriteOfflineUseCase = removeFavoriteOfflineUseCase
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
    
    func movieIsFavorite(movieId: Int) async -> Bool {
        await loadFavoriteMovies()
        if favoriteMovies.contains(where: { movie in
            movieId == movie.id
        }) {
            return true
        } else {
            return false
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

extension FavoritesViewModel {
    func loadFavoritesFromCoreData() {
        state = .loading
        let result = getFavoritesOfflineUseCase.execute()
        switch result {
        case .success(let data):
            if !data.isEmpty {
                state = .success
                coreDataFavorites = data
            } else {
                state = .empty
            }
        case .failure(let error):
            print(error)
            state = .error(error.localizedDescription)
            
        }
    }
    
    func checkFavoriteOffline(movieId: Int) {
       if let favoriteMovie = coreDataFavorites.first(where: {
            $0.id == movieId
       }) {
           let result = checkFavoriteOfflineUseCase.execute(movie: favoriteMovie)
           isFavorite = result
           print(result)
       }
        
    }
    
//    func toggleFavoriteOffline(movieId: Int) {
//        
////        if let favoriteMovie = coreDataFavorites.first(where: {
////            $0.id != movieId
////        }) {
//            addFavoriteOfflineUseCase.execute(movie: favoriteMovie)
//            print(favoriteMovie)
//            
//        }
//        isFavorite = true
//    }
}
