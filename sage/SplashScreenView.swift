//
//  SplashScreenView.swift
//  sage
//
//  Created by Aymane Hachcham on 09/01/2024.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        VStack {
            Image("splash_icon") // Replace with your logo
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the entire screen
        .background(Color(red: 0xBE / 0xFF, green: 0xE6 / 0xFF, blue: 0xCF / 0xFF)) // Hex color background
        .edgesIgnoringSafeArea(.all) // Ignore safe area to cover the whole screen
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

