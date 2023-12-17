//
//  ContentView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 10/21/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: AppScreen? = .homeScreen
    
    var body: some View {
        AppTabView(selection: $selection)
        
    }
    
}

#Preview {
 
        AppTabView(selection: .constant(.homeScreen))
            .environmentObject(ViewModel(httpClient: HTTPClient()))
    
}
