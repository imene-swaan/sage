//
//  LoginTextFieldView.swift
//  sage
//
//  Created by Aymane Hachcham on 11/01/2024.
//

import SwiftUI

struct LoginTextFieldView: View {
    @Binding var userEmail: String
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        TextField("Enter your email", text: $userEmail)
            .foregroundColor(colorScheme == .light ? Color.gray.opacity(0.5) : Color.gray.opacity(0.5))
            .padding(10)
            .frame(width: 350)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2)
            )
            .padding()
            .onSubmit {
                print(userEmail)
            }
    }
}

#Preview {
    @State var email: String = ""
    
    return LoginTextFieldView(userEmail: $email)
}
