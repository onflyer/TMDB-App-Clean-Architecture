//
//  CoreDataDTO+DomainMappers.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/23/24.
//

import Foundation
import CoreData

extension CoreDataDTO: DomainMapper {
    typealias EntityType = MovieEntity
    func toDomain() -> MovieEntity {
        return MovieEntity(id: id, posterPath: posterPath, coreDataTitle: title)
    }
}


extension MovieEntity: CoreDataMapper {
    typealias EntityType = CoreDataDTO
    
    func toCoreDataEntity(in context: NSManagedObjectContext) -> CoreDataDTO {
        let entity = CoreDataDTO(id: 3, title: "sssdds", posterPath: "ssss", context: context)
        entity.id = id
        entity.title = title
        entity.posterPath = posterPath
        do {
            try context.save()
        } catch {
          print(error)
        }
        
        
        
        return entity
        
    }
}
