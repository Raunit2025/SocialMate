//
//  CreatePostView.swift
//  SocialMate
//
//  Created by Raunit Raj on 20/04/25.
//

// CreatePostView.swift

import SwiftUI

struct CreatePostView: View {
    @EnvironmentObject var postStore: PostStore

    @State private var title = ""
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Post Title")) {
                    TextField("Enter title", text: $title)
                }

                Section(header: Text("Image")) {
                    if let inputImage = inputImage {
                        Image(uiImage: inputImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(10)
                    } else {
                        Button("Select Image") {
                            showingImagePicker = true
                        }
                    }
                }

                Button("Save Post") {
                    if let image = inputImage {
                        postStore.addPost(title: title, image: image)
                        clearForm()
                    }
                }
                .disabled(title.isEmpty || inputImage == nil)
            }
            .navigationTitle("Create Post")
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
        }
    }

    func clearForm() {
        title = ""
        inputImage = nil
    }
}

#Preview {
    CreatePostView().environmentObject(PostStore())
}



