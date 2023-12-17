//
//  TabViewNavigation.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/3/23.
//

import Foundation
import SwiftUI


enum AppScreen: Hashable, Identifiable, CaseIterable {
    
    case homeScreen
    case searchScreen
    
    var id: AppScreen { self }
}

extension AppScreen {
    
    @ViewBuilder
    var label: some View {
        switch self {
        case .homeScreen:
            Label("Home", systemImage: "film")
        case .searchScreen:
            Label("Search", systemImage: "magnifyingglass")
      
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
            case .homeScreen:
            MovieHomeScreen1()
            case .searchScreen:
           MovieSearchScreen1()
            
        }
    }
}
