//
//  sageApp.swift
//  sage
//
//  Created by Imene Kolli on 09.01.24.
//

import SwiftUI

@main
struct sageApp: App {
    @State private var isActive: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isActive {
                ContentView()
            } else {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // 3 seconds delay
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
            }
            
            
        }
    }
}
