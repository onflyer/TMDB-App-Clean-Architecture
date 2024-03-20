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
    
    
    // MARK: - Init -
    init(getNowPlayingMoviesUseCase: any GetNowPlayingMoviesUseCase) {
        self.getNowPlayingMoviesUseCase = getNowPlayingMoviesUseCase
    }
}
