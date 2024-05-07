//
//  SignUpView.swift
//  UWork
//
//  Created by jay jay on 2023-11-13.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var birthDate = ""
    @State private var trade = ""
    @State private var hourlyRate = 0.0
    @State private var phoneNumber = ""
    @State private var termsAccepted = false
    @EnvironmentObject private var viewModel: ViewModel

    // Define the color palette
    let mainGreenColor = Color.green
    let lightGrayColor = Color.gray.opacity(0.2)
    let backgroundColor = Color.white
    let formatter: NumberFormatter
    
    init() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        self.formatter = formatter
    }
    
    var body: some View {
        NavigationView {
                    Form {
                        Section(header: Text("Personal Information").foregroundColor(mainGreenColor)) {
                            TextField("First Name", text: $firstName)
                                .autocapitalization(.words)
                                .foregroundColor(mainGreenColor)
                                .padding()
                                .background(lightGrayColor)
                                .cornerRadius(5)
                            TextField("Last Name", text: $lastName)
                                .autocapitalization(.words)
                                .foregroundColor(mainGreenColor)
                                .padding()
                                .background(lightGrayColor)
                                .cornerRadius(5)
                            TextField("Phone Number", text: $phoneNumber)
                                .autocapitalization(.words)
                                .foregroundColor(mainGreenColor)
                                .padding()
                                .background(lightGrayColor)
                                .cornerRadius(5)
                        }
                        
                        Section(header: Text("Account Information").foregroundColor(mainGreenColor)) {
                            TextField("Email", text: $email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .foregroundColor(mainGreenColor)
                                .padding()
                                .background(lightGrayColor)
                                .cornerRadius(5)
                            TextField("Trade", text: $trade)
                                .autocapitalization(.words)
                                .foregroundColor(mainGreenColor)
                                .padding()
                                .background(lightGrayColor)
                                .cornerRadius(5)
                            TextField("Hourly Rate", value: $hourlyRate, formatter: formatter)
                                .keyboardType(.decimalPad)
                                .autocapitalization(.words)
                                .foregroundColor(mainGreenColor)
                                .padding()
                                .background(lightGrayColor)
                                .cornerRadius(5)
                            SecureField("Password", text: $password)
                                .foregroundColor(mainGreenColor)
                                .padding()
                                .background(lightGrayColor)
                                .cornerRadius(5)
                            SecureField("Confirm Password", text: $confirmPassword)
                                .foregroundColor(mainGreenColor)
                                .padding()
                                .background(lightGrayColor)
                                .cornerRadius(5)
                        }
                        
                        Section(header: Text("Date of Birth").foregroundColor(mainGreenColor)) {
                            TextField("Birthdate", text: $birthDate)
                                .foregroundColor(mainGreenColor)
                                .padding()
                                .background(lightGrayColor)
                                .cornerRadius(5)
                        }
                        
                        Section {
                            Toggle(isOn: $termsAccepted) {
                                Text("Accept Terms and Conditions").foregroundColor(mainGreenColor)
                            }
                        }
                        
                        Section {
                            Button(action: signUp) {
                                HStack {
                                    Spacer()
                                    Text("Sign Up")
                                        .fontWeight(.bold)
                                        .foregroundColor(backgroundColor)
                                    Spacer()
                                }
                            }
                            .padding()
                            .background(mainGreenColor)
                            .cornerRadius(8)
                            .disabled(!termsAccepted)
                        }
                    }
                    .navigationBarTitle("Sign Up", displayMode: .inline)
                    .background(backgroundColor)
                }
                .accentColor(mainGreenColor) // Changes the color of toggle and other controls
            }
    func signUp() {
        let newWorker = Workers(firstName: firstName, lastName: lastName, hourlyRate: hourlyRate, trade: trade, rating: 0, emailAddress: email, phoneNumber: phoneNumber, password: password, termsAccepted: termsAccepted)
        viewModel.createAccount(worker: newWorker)
        viewModel.isAuthenticated = true
            
        }
    }

#Preview {
    SignUpView()
}
