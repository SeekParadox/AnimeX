//
//  SignUpViewModel.swift
//  AnimeX
//
//  Created by Michael Waller on 4/1/24.
//

import Foundation
import ParseSwift

class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var showingAlert = false
    @Published var alertMessage: String = ""
    @Published var isAuthenticated = false

    func signUpUser() {
        var currentUser = User()
        
        currentUser.email = email
        currentUser.username = username
        currentUser.password = password
        
        currentUser.signup() { result in
            switch result {
            case .success(_):
                print("Successfully signed up new user")
                DispatchQueue.main.async {
                    self.isAuthenticated = User.current != nil
                }
            case .failure(let error):
                print("Failed to sign up user: \(error)")
                DispatchQueue.main.async {
                    self.alertMessage = "Failed to sig nup user:\n \(error.message)"
                    self.showingAlert = true
                }
            }
        }
    }
}

