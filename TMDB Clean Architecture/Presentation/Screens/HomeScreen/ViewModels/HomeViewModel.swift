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
    @Published var appError: AppError?
    var page = 1
    
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
        
        do {
            state = .loading
            let result = try await getNowPlayingMoviesUseCase.execute(page: page)
            nowPlayingMovies.append(contentsOf: result)
            if nowPlayingMovies.isEmpty {
                state = .empty
            } else {
                state = .success
            }
        } catch let error as AppError {
            print(error)
            self.appError = error
           state = .error(error.localizedDescription)
        } catch {
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
    
    func loadMoreNowPlayingMovies(currentItem: MovieEntity) async {
        guard nowPlayingMovies.last?.id == currentItem.id else {return}
        page += 1
        await loadNowPlayingMovies()
    }
    
    func loadMoreUpcomingMovies(currentItem: MovieEntity) async {
        guard upcomingMovies.last?.id == currentItem.id else {return}
        page += 1
        await loadUpcomingMovies()
        
    }
    
    func loadMoreTopRatedMovies(currentItem: MovieEntity) async {
        guard topRatedMovies.last?.id == currentItem.id else {return}
        page += 1
        await loadTopRatedMovies()
    }
    
    func loadMorePopularMovies(currentItem: MovieEntity) async {
        guard popularMovies.last?.id == currentItem.id else {return}
        page += 1
        await loadPopularMovies()
        
    }
    
}
