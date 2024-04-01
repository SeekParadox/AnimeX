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
 
        /**
         User.logout() will log the current.user out for you to work on the login page
         If logged in will have to restart the app 2x times for it to work
         Please comment it out when you push your code up
         **/
//        User.logout() { result in
//           
//        }
    }
}
