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
            Text("Sage")
                .foregroundColor(.white)
                .font(.custom("Avenir", size: 25))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the entire screen
        .background(Color(red: 77/255, green: 182/255, blue: 172/255)) // Hex color background
        .edgesIgnoringSafeArea(.all) // Ignore safe area to cover the whole screen
           
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

