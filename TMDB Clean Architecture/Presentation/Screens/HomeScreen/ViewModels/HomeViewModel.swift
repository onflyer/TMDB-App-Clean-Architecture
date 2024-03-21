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
    private let getUpcomingMoviesUseCase: any GetUpcomingMoviesUseCase
    private let getTopRatedMoviesUseCase: any GetTopRatedMoviesUseCase
    private let getPopularMoviesUseCase: any GetPopularMoviesUseCase
   
    
    // MARK: - Properties -
    @Published var nowPlayingMovies: [MovieEntity] = []
    @Published var upcomingMovies: [MovieEntity] = []
    @Published var topRatedMovies: [MovieEntity] = []
    @Published var popularMovies: [MovieEntity] = []
    private var page = 1
    
    // MARK: - Init -
    init(getNowPlayingMoviesUseCase: any GetNowPlayingMoviesUseCase, getUpcomingMoviesUseCase: any GetUpcomingMoviesUseCase, getTopRatedMoviesUseCase: any GetTopRatedMoviesUseCase, getPopularMoviesUseCase: any GetPopularMoviesUseCase) {
        self.getNowPlayingMoviesUseCase = getNowPlayingMoviesUseCase
        self.getUpcomingMoviesUseCase = getUpcomingMoviesUseCase
        self.getTopRatedMoviesUseCase = getTopRatedMoviesUseCase
        self.getPopularMoviesUseCase = getPopularMoviesUseCase
        
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
    
    func loadUpcomingMovies() async {
        state = .loading
        let result = await getUpcomingMoviesUseCase.execute(page: page)
        
        switch result {
        case .success(let data):
            upcomingMovies.append(contentsOf: data)
            if upcomingMovies.isEmpty {
                state = .empty
            } else {
                state = .success
            }
        case .failure(let error):
            print(error)
            state = .error(error.localizedDescription)
        }
    }
    
    func loadTopRatedMovies() async {
        state = .loading
        let result = await getTopRatedMoviesUseCase.execute(page: page)
        
        switch result {
        case .success(let data):
            topRatedMovies.append(contentsOf: data)
            if topRatedMovies.isEmpty {
                state = .empty
            } else {
                state = .success
            }
        case .failure(let error):
            print(error)
            state = .error(error.localizedDescription)
        }
    }
    
    func loadPopularMovies() async {
        state = .loading
        let result = await getPopularMoviesUseCase.execute(page: page)
        
        switch result {
        case .success(let data):
            popularMovies.append(contentsOf: data)
            if popularMovies.isEmpty {
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
