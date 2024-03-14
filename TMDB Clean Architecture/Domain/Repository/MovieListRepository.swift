//
//  MovieListRepository.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/12/24.
//

import Foundation

protocol MovieListRepository {
    
    func getMovies() async -> Result<[MovieEntity],AppError> 
        
    
}
