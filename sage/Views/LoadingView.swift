//
//  LoadingView.swift
//  sage
//
//  Created by Aymane Hachcham on 13/01/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            ProgressView("Signing in ...")
        }
    }
}

#Preview {
    LoadingView()
}
