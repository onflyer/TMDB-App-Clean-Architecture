////
////  NavigationEnvirnomentKey.swift
////  TMDB App
////
////  Created by Aleksandar Milidrag on 11/18/23.
////
//
//import Foundation
//import SwiftUI
//
//enum Route: Hashable {
//    case home
//    case detailView(Movie)
//}
//enum NavigationType: Hashable {
//    case push(Route)
//    case unwind(Route)
//}
//
//struct NavigateAction {
//    typealias Action = (NavigationType) -> ()
//    let action: Action
//    func callAsFunction(_ navigationType: NavigationType) {
//        action(navigationType)
//    }
//}
//
//struct NavigateEnvirnomentKey: EnvironmentKey {
//    static var defaultValue: NavigateAction = NavigateAction(action: { _ in })
//}
//
//extension EnvironmentValues {
//    var navigate: (NavigateAction) {
//        get {
//            self[NavigateEnvirnomentKey.self]
//        }
//        set {
//            self[NavigateEnvirnomentKey.self] = newValue
//        }
//    }
//}
//extension View {
//    func onNavigate(_ action: @escaping NavigateAction.Action) -> some View {
//        self.environment(\.navigate, NavigateAction(action: action))
//    }
//}
