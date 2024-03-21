//
//  ContainerView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/21/24.
//

import SwiftUI

struct ContainerView: View {

    @State private var selection: TabViewRouter? = .homeScreen

        var body: some View {
            AppTabView1(selection: $selection)
        }
    }


#Preview {
    ContainerView()
}

