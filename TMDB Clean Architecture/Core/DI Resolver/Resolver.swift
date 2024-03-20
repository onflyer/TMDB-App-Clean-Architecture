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
//        injectUtils()
//        injectDataSources()
//        injectRepositories()
//        injectUseCases()
//        injectViewModels()
    }
    
    /// This method is responsible for resolving a dependency.
    ///
    /// - Parameter type: The type of the dependency to be resolved.
    /// - Returns: The resolved dependency.
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
}
