//
//  ViewModel.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/18/24.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var state: ViewState = .initial
}

enum ViewState: Equatable {
    case initial, loading, error(String), success, empty
}
