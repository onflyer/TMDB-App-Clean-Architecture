//
//  DTOMapper.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/17/24.
//

import Foundation

protocol DTOMapper {
    associatedtype DTOType
    func toCodable() -> DTOType
}
