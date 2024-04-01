//
//  LoginView.swift
//  AnimeX
//
//  Created by Michael Waller on 3/31/24.
//

import SwiftUI
import ParseSwift

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @EnvironmentObject var authManager: AuthManager


    var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: $viewModel.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                
                Button("Login") {
                    viewModel.loginUser()
                }
                .alert(isPresented: $viewModel.showingAlert) {
                    Alert(title: Text("Login Failed"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
                }
                NavigationLink(destination: SignupView()) {
                    Text("Sign Up")
                }.padding()
                
            }
            .padding()
        }
        .navigationTitle("Login")
        .padding()
        .onChange(of: viewModel.isAuthenticated) {
            authManager.isAuthenticated = viewModel.isAuthenticated
        }
        
    }
}
