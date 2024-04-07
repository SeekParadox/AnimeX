//
//  AuthManager.swift
//  AnimeX
//
//  Created by Michael Waller on 3/31/24.
//

import SwiftUI
import ParseSwift

class AuthManager: ObservableObject {
    @Published var isAuthenticated: Bool = false

    init() {        
        isAuthenticated = User.current != nil
    }
    
    func logout() {
        User.logout { [weak self] result in
            switch result {
            case .success:
                print("User logged out successfully.")
                self?.isAuthenticated = false
            case .failure(let error):
                print("Error logging out: \(error)")
            }
        }
    }
}
