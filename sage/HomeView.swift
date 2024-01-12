//
//  HomeView.swift
//  sage
//
//  Created by Aymane Hachcham on 12/01/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    
    var body: some View {
        TabView {
            NavigationView {
                LoginBtnView(placeholder: "Sign Out", action: {
                    authManager.signOut()
                })
                .navigationTitle("Home")
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            NavigationView {
                LoginBtnView(placeholder: "Sign Out", action: {
                    authManager.signOut()
                })
                .navigationTitle("Notifications")
            }
            .tabItem {
                Label("Notifications", systemImage: "bell.fill")
            }
            NavigationView {
                LoginBtnView(placeholder: "Sign Out", action: {
                    authManager.signOut()
                })
                .navigationTitle("Profile")
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
