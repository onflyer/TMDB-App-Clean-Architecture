//
//  FavoritesOfflineDataSource.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/23/24.
//

import Foundation
import CoreData

// MARK: - FavoritesDataSource -
protocol FavoritesOfflineDataSource {
    func getFavorites() throws -> [MovieEntity]
    func isFavorite(movie: MovieEntity) throws -> Bool
    func addFavorite(movie: MovieEntity) throws
    func removeFavorite(movie: MovieEntity) throws
}

// MARK: - DefaultFavoritesDataSource -

class DefaultFavoriteOfflineDataSource: FavoritesOfflineDataSource {
    private let dataStack: CoreDataStack
    
    private var managedObjectContext: NSManagedObjectContext {
        dataStack.mainContext
    }
    
    init(dataStack: CoreDataStack) {
        self.dataStack = dataStack
    }
    
    func getFavorites() throws -> [MovieEntity] {
        let fetchRequest = CoreDataDTO.fetchRequest()
        let result = try managedObjectContext.fetch(fetchRequest)
        return result.map({
            
        })
    }
}

