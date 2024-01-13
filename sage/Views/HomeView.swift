//
//  HomeView.swift
//  sage
//
//  Created by Aymane Hachcham on 12/01/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @State private var showingSignOutAlert = false
    
    var body: some View {
        TabView {
            NavigationView {
                LoginBtnView(placeholder: "Sign Out", action: {
                    showingSignOutAlert.toggle()
                })
                .navigationTitle("Home")
                .confirmationDialog("Are you sure you want to sign out?", 
                                    isPresented: $showingSignOutAlert, titleVisibility: .visible) {
                    Button("Sign Out", role: .destructive) {
                        authManager.signOut()
                    }
                }
                
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            NavigationView {
                Text("What you missed!")
                    .font(.title)
                
            }
            .tabItem {
                Label("Notifications", systemImage: "bell.fill")
            }
            NavigationView {
                Text("Your profile!")
                    .font(.title)
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
        }
    }
}

#Preview {
    HomeView()
}
