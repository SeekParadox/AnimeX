//
//  SignUpView.swift
//  AnimeX
//
//  Created by Michael Waller on 4/1/24.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var isAuthenticated: AuthManager
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""

    var body: some View {
        
        VStack {
            TextField("email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding()
            
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding()
            
            Button("Signup") {
                signUpUser()
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Login Failed"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
          
        }
        
    }
    
    func signUpUser() {
        let newUser = User()
        
        newUser.email = email
        newUser.username = username
        newUser.password = password
        newUser.signup() { result in
            switch result {
            case .success(_):
                print("Successfully signed up")
                DispatchQueue.main.async {
                self.isAuthenticated.isAuthenticated = User.current != nil
                }
            
            case .failure(let error):
                print("Failed to sign up user: \(error)")
                alertMessage = "Failed to log in user:\n \(error.message)"
                showingAlert = true
            }
        }
        
    }
}
