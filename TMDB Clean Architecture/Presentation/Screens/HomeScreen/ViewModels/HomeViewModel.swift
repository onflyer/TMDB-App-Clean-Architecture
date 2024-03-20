//
//  HomeViewModel.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/20/24.
//

import Foundation


// MARK: - ViewModel -

@MainActor
final class HomeViewModel: ViewModel {
    
    // MARK: - Dependencies -
    
    private let getNowPlayingMoviesUseCase: any GetNowPlayingMoviesUseCase
    
    // MARK: - Properties -
    @Published var nowPlayingMovies: [MovieEntity] = []
    private var page = 1
    
    // MARK: - Init -
    init(getNowPlayingMoviesUseCase: any GetNowPlayingMoviesUseCase) {
        self.getNowPlayingMoviesUseCase = getNowPlayingMoviesUseCase
    }
}

extension HomeViewModel {
    func loadNowPlayingMovies() async {
        state = .loading
        let result = await getNowPlayingMoviesUseCase.execute(page: page)
        
        switch result {
        case .success(let data):
            nowPlayingMovies.append(contentsOf: data)
            if nowPlayingMovies.isEmpty {
                state = .empty
            } else {
                state = .success
            }
        case .failure(let error):
            print(error)
            state = .error(error.localizedDescription)
        }
    }
}
