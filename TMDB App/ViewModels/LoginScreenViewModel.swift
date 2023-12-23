//
//  LoginScreenViewModel.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/23/23.
//

import Foundation

@MainActor
class LoginScreenViewModel: ObservableObject {
    
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
        
    }
    
    var requestToken = ""
        
        func fetchRequestToken() async throws {
            let resource = Resource(url: Constants.Urls.fetchRequestToken,method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef")]), modelType: RequestTokenDTO.self)
            
            let requestTokenDTO = try await httpClient.load(resource)
            requestToken = requestTokenDTO.requestToken
            print(requestToken)
            
        }
    
    func loadRequestToken() async {
        do {
            try await fetchRequestToken()
        } catch {
            print(error)
        }
    }
   
}
