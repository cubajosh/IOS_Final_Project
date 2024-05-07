//
//  LoginView.swift
//  UWork
//
//  Created by jay jay on 2023-11-13.
//

import SwiftUI

struct LoginView: View {
    
        @State private var email = ""
        @State private var password = ""
    @EnvironmentObject private var viewModel: ViewModel
        
        // Define the color palette
        let mainGreenColor = Color.green
        let lightGrayColor = Color.gray.opacity(0.2)
        let backgroundColor = Color.white
    
    var body: some View {
        NavigationView {
                    Form {
                        Section(header: Text("Welcome Back!").font(.largeTitle).foregroundColor(mainGreenColor)) {
                            TextField("Email", text: $email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .foregroundColor(mainGreenColor)
                                .padding()
                                .background(lightGrayColor)
                                .cornerRadius(5)
                            SecureField("Password", text: $password)
                                .foregroundColor(mainGreenColor)
                                .padding()
                                .background(lightGrayColor)
                                .cornerRadius(5)
                        }
                        
                        Section {
                            Button(action: login) {
                                HStack {
                                    Spacer()
                                    Text("Log In")
                                        .fontWeight(.bold)
                                        .foregroundColor(backgroundColor)
                                    Spacer()
                                }
                            }
                            .padding()
                            .background(mainGreenColor)
                            .cornerRadius(8)
                        }
                        
                        Section {
                            NavigationLink(destination: SignUpView()) {
                                HStack {
                                    Spacer()
                                    Text("Don't have an account? Sign Up")
                                        .foregroundColor(mainGreenColor)
                                    Spacer()
                                }
                            }
                        }
                    }
                    .navigationBarTitle("Log In", displayMode: .inline)
                    .background(backgroundColor)
                }
                .accentColor(mainGreenColor)
            }
            
            func login() {
                // Implement the login logic here
                for worker in viewModel.workerModel{
                    if(worker.emailAddress != email && worker.password != password){
                        continue
                    }else{
                        viewModel.isAuthenticated = true
                        break
                    }
                }
                
            }
        }

#Preview {
    LoginView()
}
