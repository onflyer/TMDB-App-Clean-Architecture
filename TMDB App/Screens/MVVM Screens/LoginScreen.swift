//
//  LoginScreen.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/23/23.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject var viewModel = LoginScreenViewModel(httpClient: HTTPClient())
    
        
    var body: some View {
        VStack {
            Text("Welcome to tmdb, please tap the button and approve your session ")
            
            if let link = viewModel.validateURL {
                Link("LINK", destination: link)
            }
            
            Button("SessionID") {
                Task {
                    await viewModel.loadSessionId()
                }
            }
            
        }
        .task {
            await viewModel.loadRequestToken()
            
        }
       
    }
}

#Preview {
    LoginScreen()
}
