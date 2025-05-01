//
//  PostDetailsView.swift
//  SocialMate
//
//  Created by Raunit Raj on 20/04/25.
//

// PostDetailView.swift

import SwiftUI

struct PostDetailView: View {
    @EnvironmentObject var postStore: PostStore  // Inject the PostStore here
    @State private var newComment: String = ""
    @Binding var post: Post  // Binding to modify the post

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let image = postStore.getImage(for: post.imageName) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                        .padding()
                } else {
                    Image(post.imageName)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                        .padding()
                }
                
                Text(post.title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                
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
                
                if post.isCommenting {
                    TextField("Add a comment", text: $newComment)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button("Post Comment") {
                        if !newComment.isEmpty {
                            post.comments.append(newComment)
                            newComment = ""  // Clear comment input
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                ForEach(post.comments, id: \.self) { comment in
                    Text(comment)
                        .padding(.leading)
                }
                
                Spacer()
            }
        }
        .navigationTitle("Post Details")
    }
}

#Preview {
    PostDetailView(post: .constant(Post(title: "Sample Post", imageName: "mountain")))
        .environmentObject(PostStore())  // Ensure postStore is passed
}


