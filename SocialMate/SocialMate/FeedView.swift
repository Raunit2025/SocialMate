//
//  FeedView.swift
//  SocialMate
//
//  Created by Raunit Raj on 20/04/25.
//

// FeedView.swift

import SwiftUI

struct FeedView: View {
    @EnvironmentObject var postStore: PostStore

    var body: some View {
        NavigationStack {
            List($postStore.posts) { $post in
                NavigationLink(destination: PostDetailView(post: $post)) {
                    VStack(alignment: .leading, spacing: 10) {
                        // Show image (either loaded from file or default from assets)
                        Group {
                            if let image = postStore.getImage(for: post.imageName) {
                                Image(uiImage: image)
                                    .resizable()
                            } else {
                                Image(post.imageName)
                                    .resizable()
                            }
                        }
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)

                        Text(post.title)
                            .font(.headline)

                        HStack {
                            Button(action: {
                                post.likes += 1
                            }) {
                                HStack {
                                    Image(systemName: "hand.thumbsup.fill")
                                    Text("\(post.likes)")
                                }
                            }

                            Button(action: {
                                post.isCommenting.toggle()
                            }) {
                                HStack {
                                    Image(systemName: "message.fill")
                                    Text("\(post.comments.count)")
                                }
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Feed")
        }
    }
}

#Preview {
    FeedView().environmentObject(PostStore())
}





