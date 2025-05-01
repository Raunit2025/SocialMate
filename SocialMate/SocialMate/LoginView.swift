//
//  LoginView.swift
//  SocialMate
//
//  Created by Raunit Raj on 21/04/25.
//

import SwiftUI

struct LoginView: View {
    @AppStorage("userName") var userName: String = ""
    @AppStorage("userDetails") var userDetails: String = ""
    @State private var nameInput = ""
    @State private var detailsInput = ""
    @State private var isLoggedIn = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.3), .purple.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                Spacer()

                VStack(spacing: 20) {
                    Text("Welcome to SocialMate")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)

                    TextField("Enter your name", text: $nameInput)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)

                    TextField("Enter your details", text: $detailsInput)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)

                    Button(action: {
                        userName = nameInput
                        userDetails = detailsInput
                        isLoggedIn = true
                    }) {
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background((nameInput.isEmpty || detailsInput.isEmpty) ? Color.gray : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(nameInput.isEmpty || detailsInput.isEmpty)
                }
                .padding()
                .background(Color.white.opacity(0.95))
                .cornerRadius(16)
                .shadow(radius: 10)
                .padding()

                Spacer()
            }

            NavigationLink("", destination: MainTabView(), isActive: $isLoggedIn)
                .hidden()
        }
    }
}

#Preview {
    LoginView()
}



