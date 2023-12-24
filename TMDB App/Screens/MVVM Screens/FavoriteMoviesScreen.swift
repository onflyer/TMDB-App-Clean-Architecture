//
//  FavoriteMoviesScreen.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/23/23.
//

import SwiftUI

struct FavoriteMoviesScreen: View {
    @StateObject var viewModel = FavoriteMoviesViewModel(httpClient: HTTPClient())
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FavoriteMoviesScreen()
}
