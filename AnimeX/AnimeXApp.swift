//
//  AnimeXApp.swift
//  AnimeX
//
//  Created by Michael Waller on 3/31/24.
//

import SwiftUI
import ParseSwift


@main
struct AnimeXApp: App {
    
    init() {
        
//        let apiID = Bundle.main.infoDictionary?["APPLICATION_ID"] as? String ?? ""
//        let apiKey = Bundle.main.infoDictionary?["APPLICATION_KEY"] as? String ?? ""
        
        let apiID = "sKFFgDbHxwnD7MvYphFC1eDjjSN7ieDxQGDrrgOG"
        let apiKey = "DynVVl63eqvcF12GMuyIXv7oSC08NPHwqiSkTfCh"
        
        ParseSwift.initialize(
            applicationId: apiID,
            clientKey: apiKey,
            serverURL: URL(string: "https://parseapi.back4app.com"
                          )!)
    }
    
    @StateObject private var authManager = AuthManager()
    
    var body: some Scene {
    
        WindowGroup {
            if authManager.isAuthenticated {
                MainView()
            } else {
                LoginView()
            }
        }
        .environmentObject(authManager)
    }
}

