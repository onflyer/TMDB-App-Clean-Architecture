//
//  DomainMapper.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/14/24.
//

import Foundation

protocol DomainMapper {
    associatedtype EntityType
    func toDomain() -> EntityType
}
