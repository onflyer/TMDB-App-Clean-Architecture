//
//  LoginScreen.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/23/23.
//
// MARK: 954a0e7f7e9c282ade3daaab053db4e20c870209 session id

import SwiftUI

struct LoginScreen: View {
    @StateObject var viewModel = LoginScreenViewModel()
    
        
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
            Button("print Session id") {
                print(viewModel.sessionId)
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
