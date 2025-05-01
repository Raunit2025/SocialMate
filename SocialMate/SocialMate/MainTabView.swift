//
//  MapView.swift
//  SocialMate
//
//  Created by Raunit Raj on 20/04/25.
//
//  FeedView
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Label("Feed", systemImage: "house.fill")
                }
            
            CreatePostView()
                .tabItem {
                    Label("Create", systemImage: "plus.square.fill")
                }
            
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
            

            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}

#Preview {
    MainTabView().environmentObject(PostStore())
}

