//
//  SessionIdDTO.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/23/23.
//

import Foundation

struct SessionIdDTO: Codable {
    let success: Bool
    let sessionID: String

    enum CodingKeys: String, CodingKey {
        case success
        case sessionID = "session_id"
    }
}
