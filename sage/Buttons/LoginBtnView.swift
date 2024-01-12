/// LoginBtnView defines the standard layout of a button for the login page.
/// It includes an icon and Text.
///
/// - Parameters:
///     - icon: The icon that aligns with the sign in text.
///     - text: Given text for the login.
///

import SwiftUI

struct LoginBtnView: View {
    var icon: String?
    var placeholder: String
    var customColor: Color?
    var action: () -> Void  // Closure for the button action

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Button(action: action) {  // Use the closure here
            HStack {
                Spacer()
                if let icon = icon, !icon.isEmpty {
                    Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 23)
                        .padding(.horizontal)
                }
                Text(placeholder)
                    .font(.custom("Avenir", size: 18))
                    .foregroundColor(Color.black)
                Spacer()
            }
            .padding()
            .frame(width: 350, height: 45)
            .background(customColor ?? Color.white)
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(colorScheme == .light ? Color.gray.opacity(0.8) : Color.clear, lineWidth: 2)
            )
        }
    }
}



#Preview {
    
    LoginBtnView(icon: "apple", placeholder: "Sign in with Apple", action: {
        print("hello")
    })
}
