//
//  CustomAlert.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 12/3/23.
//

import Foundation
import SwiftUI

enum CustomAlert: Error, LocalizedError {
    case noInternetConnection(onOkPressed: () -> Void, onRetryPressed: () -> Void)
    case dataNotFound
    case urlError(error: Error)
    
    var title: String {
        switch self {
        case .noInternetConnection:
           return "No internet connection"
        case .dataNotFound:
           return "No data"
        case .urlError:
           return "Error"
        }
    }
    var subtitle: String? {
        switch self {
        case .noInternetConnection:
            return "Please check your internet connection and try again!"
        case .dataNotFound:
            return nil
        case .urlError(let error):
            return "Error: \(error.localizedDescription)"
        }
    }
    
    
   @ViewBuilder var getButtonsForAlert: some View {
       switch self {
       case .noInternetConnection(let onOkPressed, let onRetryPressed):
           Button("OK") {
               onOkPressed()
           }
           Button("RETRY") {
               onRetryPressed()
           }
       case .dataNotFound:
           Button("RETRY") {
               
           }
       default:
           Button("Delete",role: .destructive) {
               
           }
       }
    }
}
