//
//  CoreDataDTO+DomainMappers.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/23/24.
//

import Foundation
import CoreData

extension CoreDataDTO: DomainMapper {
    func toDomain() -> MovieEntity {
        return MovieEntity(backdropPath: backdropPath, id: Int(id), posterPath: posterPath, coreDataTitle: title)
    }
}


extension MovieEntity: CoreDataMapper {
    typealias EntityType = CoreDataDTO
    
    func toCoreDataEntity(in context: NSManagedObjectContext) -> CoreDataDTO {
        let entity = CoreDataDTO(context: context)
        
        entity.id = Int64(id ?? 0)
        entity.title = title
        entity.backdropPath = backdropPath
        entity.backdropPath = backdropPath
        return entity
        
    }
}
