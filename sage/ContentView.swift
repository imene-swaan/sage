//
//  ContentView.swift
//  sage
//
//  Created by Imene Kolli on 09.01.24.
//

import SwiftUI

struct ContentView: View {
    @State private var email = "Enter your email" // Store the email
    let customColor = Color(red: 77/255, green: 182/255, blue: 172/255)
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
                            .foregroundColor(.gray.opacity(0.5))
                            .padding(10)
                            .frame(width: 350)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                            .padding()
                        
                        Button(action:{
                            print("Signed with Email")
                        }){
                            HStack{
                                Text("Go")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .frame(width: 350, height: 45)
                            .background(customColor)
                            .cornerRadius(30)
                            .onTapGesture {
                                print("Signed with Email")
                            }
                        }
                        
                        
                        Button("Use Phone") {
                            print("Changed to phone")
                        }
                        .padding()
                        .foregroundColor(.white)
                        .font(.callout)
                    }
                }

                
                HStack(spacing:20){
                    Color.white
                        .frame(height: 0.5)
                        .padding(.bottom)
                        .padding(.top)
                    Text("Or")
                        .foregroundColor(.gray)
                    Color.white
                        .frame(height: 1)
                        .padding(.bottom)
                        .padding(.top)
                }
                .frame(width: 350)
                .padding(.bottom)
                .padding(.top)
                
                // Google SignIn:
                Button(action: {
                    print("Google sign In")
                }){
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
                    .frame(width: 350, height: 45)
                    .background(Color.white)
                    .cornerRadius(30)
                    .onTapGesture {
                        print("Signed with Google")
                    }
                    
                }
                // Github SignIn:
                Button(action:{
                    print("Signed with Github")
                }){
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
                    .frame(width: 350, height: 45)
                    .background(Color.white)
                    .cornerRadius(30)
                    .onTapGesture {
                        print("Signed with Github")
                    }
                }
                
                // Apple SignIn:
                Button(action:{
                    print("Signed with Apple")
                }){
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
                    .frame(width: 350, height: 45)
                    .background(Color.white)
                    .cornerRadius(30)
                    .onTapGesture {
                        print("Signed with Apple")
                    }
                }
                
                
                
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
