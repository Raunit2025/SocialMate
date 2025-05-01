//
//  Post.swift
//  SocialMate
//
//  Created by Raunit Raj on 20/04/25.
//

import Foundation

struct Post: Identifiable {
    var id = UUID()
    var title: String
    var imageName: String
    var likes: Int = 0
    var comments: [String] = []
    var isCommenting: Bool = false
}

