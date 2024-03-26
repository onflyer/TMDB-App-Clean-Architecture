//
//  FavoritesOfflineDataSource.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/23/24.
//

import Foundation
import CoreData

// MARK: - FavoritesOfflineDataSource -
protocol FavoritesOfflineDataSource {
    func getFavorites() throws -> [MovieEntity]
    func isFavorite(movie: MovieEntity) throws -> Bool
    func addFavorite(movie: MovieEntity) throws
    func removeFavorite(movie: MovieEntity) throws
}

// MARK: - DefaultFavoritesOfflineDataSource -

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
        return result.map({$0.toDomain()
        })
    }
    
    func addFavorite(movie: MovieEntity) throws {
        let coreDataMovie = movie.toCoreDataEntity(in: managedObjectContext)
        managedObjectContext.insert(coreDataMovie)
        dataStack.saveContext()
    }
    
    func removeFavorite(movie: MovieEntity) throws {
        let fetchRequest = CoreDataDTO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %d", movie.id ?? 0)
        let result = try managedObjectContext.fetch(fetchRequest)
        result.forEach({managedObjectContext.delete($0)})
        dataStack.saveContext()
    }
    func isFavorite(movie: MovieEntity) throws -> Bool {
        let fetchRequest = CoreDataDTO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %d", movie.id ?? 0)
        let result = try managedObjectContext.fetch(fetchRequest)
        
        return !result.isEmpty
    }
}

