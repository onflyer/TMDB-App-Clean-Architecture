//
//  ContentView.swift
//  TMDB Movies - Apple's MV Architecture
//
//  Created by Aleksandar Milidrag on 10/5/23.
//

import SwiftUI

struct TabViewScreen: View {
//    @State private var routes: [Route] = []
    
    var body: some View {
        TabView {
            NavigationStack {
                //            NavigationStack(path: $routes) {
                ContentView()
                    .navigationTitle("TMDB App")
                //                    .navigationDestination(for: Route.self) { route in
                //                        switch route {
                //                        case .home:
                //                            TabViewScreen()
                //                        case .detailView(let movie):
                //                            Text(movie.title)
                //                        }
                //                    }
                //                    .onNavigate { navType in
                //                        switch navType {
                //                        case .push(let route):
                //                            routes.append(route)
                //                        case .unwind(let route):
                //                            if route == .home {
                //                                routes = []
                //                            } else {
                //                                guard let index = routes.firstIndex(where: { $0 == route })  else { return }
                //                                routes = Array(routes.prefix(upTo: index + 1))
                //                            }
                //                        }
                //                    }
                //            }
            }
            .tabItem {
                Label("Home", systemImage: "film")
            }
            .tag(0)
            
            
            NavigationStack {
                MovieSearchScreen()
                    .navigationTitle("Search")
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

