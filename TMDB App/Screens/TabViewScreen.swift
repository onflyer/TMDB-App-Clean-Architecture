//
//  ContentView.swift
//  TMDB Movies - Apple's MV Architecture
//
//  Created by Aleksandar Milidrag on 10/5/23.
//

import SwiftUI

struct TabViewScreen: View {
    @State private var routes: [Route] = []
    
    var body: some View {
        TabView {
            NavigationStack(path: $routes) {
                ContentView()
                    .navigationTitle("TMDB App")
                    .environment(\.navigate) { route in
                        routes.append(route)
                    }
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .detailView(let movie):
                            Text(movie.title)
                        }
                    }
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
            .environmentObject(ViewModel(httpClient: HTTPClient()))
    }
}

