//
//  AuthManager.swift
//  AnimeX
//
//  Created by Michael Waller on 3/31/24.
//

import Foundation


import SwiftUI
import ParseSwift

class AuthManager: ObservableObject {
    @Published var isAuthenticated: Bool = false

    
    init() {        
        isAuthenticated = User.current != nil
//        User.logout() { result in
//           
//        }
    }
}
