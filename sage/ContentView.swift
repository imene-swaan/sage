//
//  ContentView.swift
//  sage
//
//  Created by Imene Kolli on 09.01.24.
//

import SwiftUI

struct ContentView: View {
    @State private var email = "Enter your email" // Store the email
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                VStack(spacing: 0){
                    Image("splash_icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                    Text("Chat and Learn with Sage")
                        .foregroundColor(.white)
                        .padding(.bottom)
                        .font(.custom("Helvetica Neue", size: 24))
                        .fontDesign(.rounded)
                    VStack{
                        TextField("Enter your email", text: $email)
                            .foregroundColor(.gray)
                            .padding(10)
                            .frame(width: 350)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                            .padding()
                        Button(action: {
                            print("Go with email")
                        }, label: {
                            Text("Go")
                                .foregroundColor(Color.white)
                                .background(Color(red: 0xBE / 0xFF, green: 0xE6 / 0xFF, blue: 0xCF / 0xFF))
                                .padding()
                                .cornerRadius(23)
                        })
                    }
                }
                
                // Google SignIn:
                HStack{
                    Spacer()
                    Image("google")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 23)
                        .padding(.horizontal)
                    Text("Continue with Google")
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding()
                .frame(width: 350)
                .background(Color.white)
                .cornerRadius(30)
                
                // Github SignIn:
                HStack{
                    Spacer()
                    Image("github")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal)
                        .frame(height: 23)
                    Text("Continue with Github")
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding()
                .frame(width: 350)
                .background(Color.white)
                .cornerRadius(30)
                
                // Apple SignIn:
                HStack{
                    Spacer()
                    Image("apple")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 23)
                        .padding(.horizontal)
                    Text("Continue with Apple")
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding()
                .frame(width: 350)
                .background(Color.white)
                .cornerRadius(30)
                
                
                
                // Terms and Services, privacy Policy
                HStack(alignment: .top, spacing: 0){
                    Text("By continuing, you are agreeing to Sage's Terms of Service and Privacy Policy.")
                        .foregroundColor(.gray)
                }
                .padding()
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                
                
            }
        }
        
        
        
    }
}

#Preview {
    ContentView()
}
