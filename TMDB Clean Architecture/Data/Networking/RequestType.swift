//
//  RequestType.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/12/24.
//

import Foundation

enum RequestType {
  case GET
  case POST(Data?)
  case DELETE
    
    var name: String {
        switch self {
        case .GET:
           return "GET"
        case .POST:
           return "POST"
        case .DELETE:
           return "DELETE"
        }
    }

}
