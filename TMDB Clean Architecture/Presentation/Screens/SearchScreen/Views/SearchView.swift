//
//  SearchView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/21/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = Resolver.shared.resolve(SearchViewModel.self)
    
    var body: some View {
        ZStack {
        Text("ss")
        }
    }
}

#Preview {
    SearchView()
}
