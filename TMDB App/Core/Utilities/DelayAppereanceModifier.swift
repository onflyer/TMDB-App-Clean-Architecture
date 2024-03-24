////
////  DelayAppereanceModifier.swift
////  TMDB App
////
////  Created by Aleksandar Milidrag on 12/3/23.
////
//
//import SwiftUI
//
//struct DelayAppeareanceModifier: ViewModifier {
//    @State var shouldRender = false
//    let delay: Double
//    
//    func body(content: Content) -> some View {
//        render(content)
//            .onAppear {
//                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                    self.shouldRender = true
//                }
//            }
//    }
//    @ViewBuilder
//    private func render(_ content: Content) -> some View {
//        if shouldRender {
//            content
//        } else {
//            content
//                .hidden()
//        }
//    }
//}
//public extension View {
//    func delayAppearance(bySeconds seconds: Double) -> some View {
//        modifier(DelayAppeareanceModifier(delay: seconds))
//    }
//}
