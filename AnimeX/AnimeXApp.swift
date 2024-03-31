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
        
        let apiID = Bundle.main.infoDictionary?["APPLICATION_ID"] as? String ?? ""
        let apiKey = Bundle.main.infoDictionary?["APPLICATION_KEY"] as? String ?? ""
        
        ParseSwift.initialize(
            applicationId: apiID,
            clientKey: apiKey,
            serverURL: URL(string: "https://parseapi.back4app.com"
                          )!)
    }
  
    var body: some Scene {
    
        WindowGroup {
    
            ContentView()
        }
    }
}

