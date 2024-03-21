//
//  AppTabView1.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/21/24.
//

import SwiftUI

struct AppTabView1: View {
    @Binding var selection: TabViewRouter?
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(TabViewRouter.allCases) { screen in
                screen.destination
                    .tag(screen as TabViewRouter?)
                    .tabItem { screen.label }
            }
        }
        
    }
}

#Preview {
    AppTabView1(selection: .constant(.homeScreen))
//        .environmentObject(ViewModel(httpClient: HTTPClient()))
}

