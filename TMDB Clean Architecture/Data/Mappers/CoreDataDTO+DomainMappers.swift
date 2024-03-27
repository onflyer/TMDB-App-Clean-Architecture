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
        let entity = CoreDataDTO(id: id ?? 0, title: title ?? "NO TITLE", posterPath: posterPath ?? "NO POSTER PATH", context: context)
        entity.id = id
        entity.title = title
        entity.posterPath = posterPath
        
        return entity
        
    }
}
