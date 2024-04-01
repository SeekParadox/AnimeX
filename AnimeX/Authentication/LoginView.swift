//
//  LoginView.swift
//  AnimeX
//
//  Created by Michael Waller on 3/31/24.
//

import Foundation
import SwiftUI

import ParseSwift

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @EnvironmentObject var isAuthenticated: AuthManager


    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding()

            Button("Login") {
                loginUser()
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Login Failed"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            
        }
        .padding()
    }
    
    func loginUser() {
        print(username)
        print(password)
        User.login(username: username, password: password) { result in
            switch result {
            case .success(_):
                print("Successfully loggedin")
                DispatchQueue.main.async {
                self.isAuthenticated.isAuthenticated = User.current != nil

                }

            case .failure(let error):
                print("Failed to log in user: \(error)")
                alertMessage = "Failed to log in user:\n \(error.message)"
                showingAlert = true
            }
        }
    }
}
