//
//  SocialMateApp.swift
//  SocialMate
//
//  Created by Raunit Raj on 20/04/25.
//

// SocialMateApp.swift

import SwiftUI

@main
struct SocialMateApp: App {
    @StateObject private var postStore = PostStore()
    @AppStorage("userName") var userName: String = ""

    var body: some Scene {
        WindowGroup {
            if userName.isEmpty {
                LoginView()
                    .environmentObject(postStore)
            } else {
                MainTabView()
                    .environmentObject(postStore)
            }
        }
    }
}

