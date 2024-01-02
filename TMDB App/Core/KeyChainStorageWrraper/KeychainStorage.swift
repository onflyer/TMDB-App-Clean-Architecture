//
//  KeychainStorage.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 1/2/24.
//

import Foundation
import KeychainSwift

@propertyWrapper
struct KeychainStorage {

    private let key: String
    private lazy var keychain = KeychainSwift()

    init(key: String) {
        self.key = key
    }

    var wrappedValue: String? {
        mutating get {
            keychain.get(key)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: key)
            } else {
                keychain.delete(key)
            }
        }
    }

}
