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
        if authManager.authState != .signedOut {
            HomeView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
