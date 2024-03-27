//
//  TabViewRouter.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/21/24.
//

import Foundation
import SwiftUI

enum TabViewRouter: Hashable, Identifiable, CaseIterable {
    
    case homeScreen
    case searchScreen
    case favoritesScreen
    case favoritesOffline
    
    var id: TabViewRouter { self }
}

extension TabViewRouter {
    
    @ViewBuilder
    var label: some View {
        switch self {
        case .homeScreen:
            Label("Home", systemImage: "film")
        case .searchScreen:
            Label("Search", systemImage: "magnifyingglass")
        case .favoritesScreen:
            Label("Favorite online", systemImage: "arrow.up.heart")
        case .favoritesOffline:
            Label("Favorites offline", systemImage: "arrow.down.heart")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
            case .homeScreen:
            HomeView()
            case .searchScreen:
            SearchView()
            case .favoritesScreen:
            FavoritesView()
        case .favoritesOffline:
            FavoritesOfflineView()
        }
    }
}
