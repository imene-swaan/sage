//
//  ContentView.swift
//  sage
//
//  Created by Imene Kolli on 09.01.24.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    @State private var email = "" // Store the email
    @State private var phone = "" // Store the email
    @State private var isLayoutEmail = true
    @State private var selectedCountryCode = "+1"
    @State private var phoneNumber = "Phone Number"
    @State private var showingPicker = false
    @Environment(\.colorScheme) var colorScheme
    
    private var backgroundColor: Color {
        colorScheme == .dark ? .black : .white
    }
    
    private var shapeColor: Color {
        colorScheme == .dark ? .white : .black
    }

    let countries = [
        (code: "+1", flag: "us"),
        (code: "+44", flag: "fr"),
        (code: "+49", flag: "de")
        // Add all countries you need
    ]
    let customColor = Color(red: 77/255, green: 182/255, blue: 172/255)
    
    var body: some View {
        ZStack{
            Color(backgroundColor)
                .ignoresSafeArea()
                    
            VStack(spacing: 20){
                VStack(spacing: 0){
                    Image("splash_icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                    Text("Chat and Learn with Sage")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .padding(.bottom)
                        .font(.custom("Helvetica-Regular", size: 26))
                        .fontDesign(.rounded)
                    VStack{
                        if isLayoutEmail {
                            LoginTextFieldView(userEmail: $email)
                        } else {
                            CountryCodePickerView(selectedCountryCode: $selectedCountryCode, phoneNumber: $phoneNumber, countries: countries)
                        }
                        
                        LoginBtnView(placeholder: "Go", customColor: customColor, action:{
                            print(email)
                        })
                        
                        
                        if isLayoutEmail {
                            Button("Use Phone") {
                                print("Changed to phone")
                                isLayoutEmail.toggle()
                            }
                            .padding()
                            .foregroundColor(shapeColor)
                            .font(.callout)
                        } else {
                            Button("Use Email") {
                                print("Changed to email")
                                isLayoutEmail.toggle()
                            }
                            .padding()
                            .foregroundColor(shapeColor)
                            .font(.callout)
                        }
                    }
                }

                // Separator between Email sign in and Social media sign in
                HStack(spacing:20){
                    Color(shapeColor)
                        .frame(height: 0.5)
                        .padding(.bottom)
                        .padding(.top)
                    Text("Or")
                        .foregroundColor(.gray)
                    Color(shapeColor)
                        .frame(height: 1)
                        .padding(.bottom)
                        .padding(.top)
                }
                .frame(width: 350)
                .padding(.bottom)
                .padding(.top)
                
                // Google SignIn:
                LoginBtnView(icon: "google", placeholder: "Continue with Google", action: {
                    print("google")
                })
                // Github SignIn:
                LoginBtnView(icon: "github", placeholder: "Continue with Github", action:{
                    print("github")
                })
                // Apple SignIn:
                LoginBtnView(icon: "apple", placeholder: "Continue with Apple", action:{
                    print("apple")
                })
                
                
                // Terms and Services, privacy Policy
                HStack(alignment: .top, spacing: 0){
                    Text("By continuing, you are agreeing to Sage's [Terms of Service](https://www.google.com) and [Privacy Policy](https://www.google.com).")
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
                .padding(20)
                .padding(.top)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .font(.footnote)
                                
            }
        }
    }
}

#Preview {
    ContentView()
}
