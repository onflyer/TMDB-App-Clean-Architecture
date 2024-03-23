//
//  BaseStateView.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/23/24.
//

import SwiftUI

/// Handle changes in the state of the given [ViewModel] and display the appropriate view.
struct BaseStateView<SuccessView, NoItemsView, ErrorView, LoadingView>: View
where SuccessView: View, NoItemsView: View, ErrorView: View,
      LoadingView: View {
    
    let state: ViewState
    let successView: () -> SuccessView
    let emptyView: () -> NoItemsView
    let errorView: (String) -> ErrorView
    let loadingView: () -> LoadingView
    
    /// Initialize the view with the given [ViewModel] and views to display in each state.
    ///
    /// - Parameters:
    ///  - viewModel: The [ViewModel] to observe its state.
    ///  - successView: The view to display when the state is [ViewState.success].
    ///  - emptyView: The view to display when the state is [ViewState.empty].
    ///  - errorView: The view to display when the state is [ViewState.error].
    ///  - loadingView: The view to display when the state is [ViewState.loading].
    ///
    ///  - Note: The default value for each view is nil, so you have to provide at least the successView.
    init(state: ViewState = .initial,
         @ViewBuilder successView: @escaping () -> SuccessView,
         @ViewBuilder emptyView: @escaping () -> NoItemsView
        /* = { MessageView(message: "noDataFound".localized()) }*/,
         @ViewBuilder errorView: @escaping (String) -> ErrorView
         /*= {MessageView(message: $0)}*/,
         @ViewBuilder loadingView: @escaping () -> LoadingView
         /*= { ProgressView() }*/) {
        self.state = state
        self.loadingView = loadingView
        self.successView = successView
        self.emptyView = emptyView
        self.errorView = errorView
        
    }
    
    var body: some View {
        ZStack {
            switch state {
            case .initial:
                emptyView()
            case .loading:
                loadingView()
            case .error(let errorMessage):
                errorView(errorMessage)
            case .success:
                successView()
            case .empty:
                emptyView()
            }
        }
    }
}
