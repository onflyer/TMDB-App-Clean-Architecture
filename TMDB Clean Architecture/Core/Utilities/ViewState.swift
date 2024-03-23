//
//  ViewState.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/23/24.
//

import Foundation

enum ViewState: Equatable {
    case initial, loading, error(String), success, empty
}
