//
//  AppState.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 11/18/23.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    
    case detailView(Movie)
}

struct NavigateEnvirnomentKey: EnvironmentKey {
    static var defaultValue: (Route) -> Void = { _ in
        
    }
}

extension EnvironmentValues {
    var navigate: (Route) -> Void {
        get {
            self[NavigateEnvirnomentKey.self]
        }
        set {
            self[NavigateEnvirnomentKey.self] = newValue
        }
    }
}
