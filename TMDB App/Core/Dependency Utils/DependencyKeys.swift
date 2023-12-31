//
//  DependencyKeys.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/31/23.
//

import Foundation
import Dependencies


private enum HTTPClientKey: DependencyKey {
    static let liveValue = HTTPClient()
}

extension DependencyValues {
    var httpClient: HTTPClient {
        get { self[HTTPClientKey.self] }
        set { self[HTTPClientKey.self] = newValue }
          }
    }

