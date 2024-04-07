//
//  MainView.swift
//  AnimeX
//
//  Created by Michael Waller on 4/1/24.

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Label("Feed", systemImage: "list.dash")
                }

            PopularView()
                .tabItem {
                    Label("Popular", systemImage: "sparkles")
                }
            
            PostView()
                .tabItem {
                    Label("Post", systemImage: "plus.circle")
                }
            
            RecommendedView()
                .tabItem {
                    Label("Recommended", systemImage: "heart.text.square.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}
