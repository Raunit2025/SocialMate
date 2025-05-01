//
//  PostStore.swift
//  SocialMate
//
//  Created by Raunit Raj on 21/04/25.
//

import SwiftUI

class PostStore: ObservableObject {
    @Published var posts: [Post] = [
        Post(title: "Trip to Himalayas", imageName: "mountain"),
        Post(title: "Exploring Beaches", imageName: "beach"),
        Post(title: "City Adventures", imageName: "city")
    ]
    
    func addPost(title: String, image: UIImage) {
        let imageName = saveImage(image: image)
        let newPost = Post(title: title, imageName: imageName)
        posts.insert(newPost, at: 0)  // newest first
    }
    
    private func saveImage(image: UIImage) -> String {
        let filename = UUID().uuidString + ".png"
        if let data = image.pngData() {
            let url = FileManager.default.temporaryDirectory.appendingPathComponent(filename)
            try? data.write(to: url)
        }
        return filename
    }
    
    func getImage(for imageName: String) -> UIImage? {
        let url = FileManager.default.temporaryDirectory.appendingPathComponent(imageName)
        return UIImage(contentsOfFile: url.path)
    }
}
