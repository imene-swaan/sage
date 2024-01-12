//
//  CountryCodePickerView.swift
//  sage
//
//  Created by Aymane Hachcham on 10/01/2024.
//

import SwiftUI

struct CountryCodePickerView: View {
    @Binding var selectedCountryCode: String
    @Binding var phoneNumber: String
    let countries: [(code: String, flag: String)]
    
    var body: some View {
        HStack {
                    Menu {
                        Picker("Select your country", selection: $selectedCountryCode) {
                            ForEach(countries, id: \.code) { country in
                                HStack {
                                    Image(country.flag) // Assuming flags are stored as assets with these names
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 20)
                                    Text(country.code)
                                        .font(.caption)
                                }
                                .tag(country.code)
                            }
                        }
                        .foregroundColor(.gray.opacity(0.5))
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                        .padding()
                    } label: {
                        HStack {
                            Image(systemName: "arrowtriangle.down")
                            Text(selectedCountryCode)
                                .foregroundColor(.white)
                        }
                        .padding(.all)
                    }
                    .fixedSize()

                    Divider()
                        .frame(height: 30)
                    
                    TextField("Phone number", text: $phoneNumber)
                        .keyboardType(.numberPad)
                        .padding(.all)
                        .foregroundColor(.gray.opacity(0.5))
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding()
            }
    }


#Preview {
    // Define initial values for the preview
    @State var previewSelectedCountryCode = "+1"
    @State var previewPhoneNumber = ""
    let countries = [
            (code: "+1", flag: "us"),
            (code: "+44", flag: "fr"),
            (code: "+49", flag: "de")
            // Add all countries you need
        ]
    
    return CountryCodePickerView(selectedCountryCode: $previewSelectedCountryCode, phoneNumber: $previewPhoneNumber, countries:  countries)
}
