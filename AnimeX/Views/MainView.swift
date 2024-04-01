//
//  MainView.swift
//  AnimeX
//
//  Created by Michael Waller on 4/1/24.
//

import SwiftUI

struct MainView: View {
            
        var body: some View {
            
            ZStack(alignment: .bottom){
                TabView() {
                    FeedView()
                            .tabItem {
                                Label("Feed View", systemImage: "list.dash")
                            }

                    PopularView()
                        .tabItem {
                            Label("Popular View", systemImage: "sparkles")
                                
                        }
                    
                    PostView()
                        .tabItem {
                            Label("Post View", systemImage: "plus.circle")
                                
                        }
                    
                    RecommendedView()
                        .tabItem {
                            Label("Recommended View", systemImage: "heart.text.square.fill")
                                
                        }
                    
                    ProfileView()
                        .tabItem {
                            Label("Profile View", systemImage: "person.crop.circle")
                                
                        }
                }
            }
        }
    
    
}





