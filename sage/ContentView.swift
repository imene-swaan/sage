//
//  ContentView.swift
//  sage
//
//  Created by Aymane Hachcham on 12/01/2024.
//

import SwiftUI
import AuthenticationServices
import GoogleSignIn

struct ContentView: View {
    @EnvironmentObject var authManager: AuthenticationManager
        
    var body: some View {
        VStack {
            if authManager.authState != .signedOut {
                HomeView()
                    .transition(.move(edge: .trailing))
            } else {
                LoginView()
                    .transition(.move(edge: .trailing))
            }
        }
        .animation(.easeInOut(duration: 0.5), value: authManager.authState)
    }
}

#Preview {
    ContentView()
}
