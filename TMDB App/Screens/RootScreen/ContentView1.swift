//
//  ContentView1.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/17/23.
//

import SwiftUI


struct ContentView1: View {

    @State private var selection: AppScreen? = .homeScreen

        var body: some View {
            AppTabView(selection: $selection)
        }
    }


#Preview {
    ContentView1()
}
