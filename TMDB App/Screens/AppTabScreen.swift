//
//  AppTabView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/3/23.
//

import SwiftUI

struct AppTabScreen: View {
    @Binding var selection: AppScreen?
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppScreen.allCases) { screen in
                screen.destination
                    .tag(screen as AppScreen?)
                    .tabItem { screen.label }
            }
        }
        
    }
}

#Preview {
    AppTabScreen(selection: .constant(.homeScreen))
        .environmentObject(ViewModel(httpClient: HTTPClient()))
}
