//
//  ContentView.swift
//  TMDB Movies - Apple's MV Architecture
//
//  Created by Aleksandar Milidrag on 10/5/23.
//

import SwiftUI

struct TabViewScreen: View {
    var body: some View {
        TabView {
            NavigationStack {
               ContentView()
                    .navigationTitle("TMDB Movies")
            }
            .tabItem {
                Label("Home", systemImage: "film")
            }
            .tag(0)
            
            NavigationStack {
               MovieSearchScreen()

            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            .tag(1)
        }
    }
}

struct TabViewScreen_Previews: PreviewProvider {
    static var previews: some View {
            TabViewScreen()
            .environmentObject(ViewModel())
        }
    }

