//
//  loginViewModel.swift
//  AnimeX
//
//  Created by Michael Waller on 4/1/24.
//

import Foundation
import ParseSwift

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var showingAlert = false
    @Published var alertMessage: String = ""
    @Published var isAuthenticated = false

    func loginUser() {
        User.login(username: username, password: password) { result in
            switch result {
            case .success(_):
                print("Successfully logged in")
                DispatchQueue.main.async {
                    self.isAuthenticated = User.current != nil
                }
            case .failure(let error):
                print("Failed to log in user: \(error)")
                DispatchQueue.main.async {
                    self.alertMessage = "Failed to log in user:\n \(error.message)"
                    self.showingAlert = true
                }
            }
        }
    }
}
