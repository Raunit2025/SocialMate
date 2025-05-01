//
//  ProfileView.swift
//  SocialMate
//
//  Created by Raunit Raj on 20/04/25.
//

// ProfileView.swift

import SwiftUI

struct ProfileView: View {
    @AppStorage("userName") var userName: String = ""
    @AppStorage("userDetails") var userDetails: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 120, height: 120)
                .foregroundColor(.blue)

            Text(userName)
                .font(.title)
                .bold()

            Text(userDetails)
                .foregroundColor(.secondary)

            Spacer()

            Button("Logout") {
                userName = ""
                userDetails = ""
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("Profile")
    }
}

#Preview {
    ProfileView()
}





