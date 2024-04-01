//
//  SignUpView.swift
//  AnimeX
//
//  Created by Michael Waller on 4/1/24.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var authManager: AuthManager
    @StateObject private var viewModel = SignUpViewModel()
    var body: some View {
        
        VStack {
            TextField("email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding()
            
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding()
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding()
            
            Button("Signup") {
                viewModel.signUpUser()
            }
            .alert(isPresented: $viewModel.showingAlert) {
                Alert(title: Text("Sign up Failed"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
            }
          
        }
        .onChange(of: viewModel.isAuthenticated) {
            authManager.isAuthenticated = viewModel.isAuthenticated
        }
    }
}
