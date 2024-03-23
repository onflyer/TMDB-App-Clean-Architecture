//
//  CoreDataMapper.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/23/24.
//

import Foundation
import CoreData

protocol CoreDataMapper {
    associatedtype EntityType
    
    /// Convert the domain entity to a Core Data entity
    /// - Parameter context: The context to insert the entity in
    /// - Returns: The Core Data entity
    func toCoreDataEntity(in context: NSManagedObjectContext) -> EntityType
}
