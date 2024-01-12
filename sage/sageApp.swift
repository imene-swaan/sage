//
//  sageApp.swift
//  sage
//
//  Created by Imene Kolli on 09.01.24.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn


class AppDelegate: NSObject, UIApplicationDelegate {
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
    
}

@main
struct sageApp: App {
    // register app delegate for firebase setup.
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var isActive: Bool = false
    @StateObject var authManager = AuthenticationManager()
    
    init(){
        FirebaseApp.configure()
        
        // Initialize auth manager:
        let authManager = AuthenticationManager()
        _authManager = StateObject(wrappedValue: authManager)
    }
    
    var body: some Scene {
        WindowGroup {
            if isActive {
                ContentView()
                    .environmentObject(authManager)
            } else {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // 3 seconds delay
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
            }
            
            
        }
    }
}
