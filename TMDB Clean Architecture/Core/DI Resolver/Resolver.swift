//
//  Resolver.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/20/24.
//

import Foundation
import Swinject

class Resolver {
    
    /// The shared instance of the resolver.
    static let shared = Resolver()
    
    /// The container that holds all the dependencies.
    private var container = Container()
    
    /// This method is responsible for injecting all dependencies in the app.
    ///
    /// > It should be called only once in the app's lifecycle.
    @MainActor func injectModules() {
        injectUtils()
        injectDataSources()
        injectRepositories()
        injectUseCases()
        injectViewModels()
    }
    
    /// This method is responsible for resolving a dependency.
    ///
    /// - Parameter type: The type of the dependency to be resolved.
    /// - Returns: The resolved dependency.
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
}

// MARK: - Injecting Utils -
extension Resolver {
    private func injectUtils() {
        container.register(NetworkManager.self) { _ in
            DefaultNetworkManager()
        }.inObjectScope(.container)
        container.register(RequestManager.self) { resolver in
            DefaultRequestManager(networkManager: resolver.resolve(NetworkManager.self)!)
        }.inObjectScope(.container)
    }
}

// MARK: - Injecting DataSources -
extension Resolver {
    private func injectDataSources() {
        container.register(MovieDataSource.self) { resolver in
            DefaultMovieDataSource(requestManager: resolver.resolve(RequestManager.self)!)
        }.inObjectScope(.container)
        container.register(SearchMoviesDataSource.self) { resolver in
            DefaultSearchMoviesDataSource(requestManager: resolver.resolve(RequestManager.self)!)
        }.inObjectScope(.container)
        container.register(FavoriteMoviesDataSource.self) { resolver in
            DefaultFavoriteMoviesDataSource(requestManager: resolver.resolve(RequestManager.self)!)
        }.inObjectScope(.container)
    }
}

// MARK: - Injecting Repositories -
extension Resolver {
    private func injectRepositories() {
        
        container.register(MovieListRepository.self) { resolver in
            DefaultMoviesRepository(moviesDatasource: resolver.resolve(MovieDataSource.self)!)
        }.inObjectScope(.container)
        container.register(SearchMovieRepository.self) { resolver in
            DefaultSearchMoviesRepository(moviesDatasource: resolver.resolve(SearchMoviesDataSource.self)!)
        }.inObjectScope(.container)
        container.register(FavoritesRepository.self) { resolver in
            DefaultFavoriteMoviesRepository(moviesDatasource: resolver.resolve(FavoriteMoviesDataSource.self)!)
        }.inObjectScope(.container)
    }
}

// MARK: - Injecting Use Cases -

extension Resolver {
    private func injectUseCases() {
        
        // MARK: - MovieListUseCases -
        container.register(GetNowPlayingMoviesUseCase.self) { resolver in
            GetNowPlayingMoviesUseCaseImpl(repository: resolver.resolve(MovieListRepository.self)!)
        }.inObjectScope(.container)
        container.register(GetUpcomingMoviesUseCase.self) { resolver in
            GetUpcomingMoviesUseCaseImpl(repository: resolver.resolve(MovieListRepository.self)!)
        }.inObjectScope(.container)
        container.register(GetTopRatedMoviesUseCase.self) { resolver in
            GetTopRatedMoviesUseCaseImpl(repository: resolver.resolve(MovieListRepository.self)!)
        }.inObjectScope(.container)
        container.register(GetPopularMoviesUseCase.self) { resolver in
            GetPopularMoviesUseCaseImpl(repository: resolver.resolve(MovieListRepository.self)!)
        }.inObjectScope(.container)
        container.register(GetMovieByIdUseCase.self) { resolver in
            GetMoviebyIdUseCaseImpl(repository: resolver.resolve(MovieListRepository.self)!)
        }.inObjectScope(.container)
        
        // MARK: - SearchMoviesUseCases -
        container.register(SearchMovieUseCase.self) { resolver in
            SearchMovieUseCaseImpl(repository: resolver.resolve(SearchMovieRepository.self)!)
        }.inObjectScope(.container)
        
        // MARK: - FavoriteMoviesUseCases -
        container.register(GetFavoritesUseCase.self) { resolver in
            GetFavoritesUseCaseImpl(repository: resolver.resolve(FavoritesRepository.self)!)
        }.inObjectScope(.container)
        container.register(PostMovieToFavoritesUseCase.self) { resolver in
            PostMovieToFavoriteUseCaseImpl(repository: resolver.resolve(FavoritesRepository.self)!)
        }.inObjectScope(.container)
        container.register(DeleteMovieFromFavoritesUseCase.self) { resolver in
            DeleteMovieFromFavoritesUseCaseImpl(repository: resolver.resolve(FavoritesRepository.self)!)
        }.inObjectScope(.container)
        
    }
}

// MARK: - Injecting ViewModels -
extension Resolver {
    @MainActor
    private func injectViewModels() {
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(
                getNowPlayingMoviesUseCase: resolver.resolve(GetNowPlayingMoviesUseCase.self)!,
                getUpcomingMoviesUseCase: resolver.resolve(GetUpcomingMoviesUseCase.self)!,
                getTopRatedMoviesUseCase: resolver.resolve(GetTopRatedMoviesUseCase.self)!,
                getPopularMoviesUseCase: resolver.resolve(GetPopularMoviesUseCase.self)!
            )
        }
        
        container.register(SearchViewModel.self) { resolver in
            SearchViewModel(
                searchMovieUseCase: resolver.resolve(SearchMovieUseCase.self)!
            )
        }
        container.register(FavoritesViewModel.self) { resolver in
            FavoritesViewModel(
                getFavoritesUseCase: resolver.resolve(GetFavoritesUseCase.self)!, 
                deleteFavoriteMovieUseCase: resolver.resolve(DeleteMovieFromFavoritesUseCase.self)!,
                postMovieToFavoritesUseCase: resolver.resolve(PostMovieToFavoritesUseCase.self)!
            )
        }
        container.register(DetailViewModel.self) { resolver in
            DetailViewModel(
                getMovieByIdUseCase: resolver.resolve(GetMovieByIdUseCase.self)!
            )
        }
    }
    
}
