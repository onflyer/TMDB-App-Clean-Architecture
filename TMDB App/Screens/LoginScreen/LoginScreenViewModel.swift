//
//  LoginScreenViewModel.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/23/23.
//

import Foundation
import Dependencies

@MainActor
class LoginScreenViewModel: ObservableObject {
    
    @Dependency(\.httpClient) var httpClient
    
        @Published var validateURL: URL?
        
        var requestToken: String?
        
        func fetchRequestTokenURL() async throws {
            let resource = Resource(url: Constants.Urls.fetchRequestToken,method: .get([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef")]), modelType: RequestTokenDTO.self)
            
            let requestTokenDTO = try await httpClient.load(resource)
            
            let validateTokenURL = Constants.Urls.validateRequestToken.appending(component: requestTokenDTO.requestToken)
            print(validateTokenURL)
            
            requestToken = requestTokenDTO.requestToken
            validateURL = validateTokenURL
        }
    
    func loadRequestToken() async {
        do {
            try await fetchRequestTokenURL()
        } catch {
            print(error)
        }
    }
    
    func fetchSessionId() async throws {
        guard requestToken != nil else {
            return
        }

        let data = ["request_token" : requestToken]
        
        let resource = try Resource(url: Constants.Urls.sessionId, method: .post(JSONEncoder().encode(data), ([URLQueryItem(name: "api_key", value: "89e4bae37305d94ef67db0a32d6e79ef")])), modelType: SessionIdDTO.self)
        
        let sessionIdDTO = try await httpClient.load(resource)
        
        print(sessionIdDTO)
    }
    
    func loadSessionId() async {
        do {
            try await fetchSessionId()
        } catch {
            print(error)
        }
    }
    
    
   
    
    
   
}
