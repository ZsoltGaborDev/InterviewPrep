//
//  User.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import Foundation

struct User: Identifiable, Codable {
    let id: Int
    let username: String
    let email: String
}

extension User {
    static let mockUsers: [User] = [
        User(id: 1, username: "alex_smith", email: "alex@example.com"),
        User(id: 2, username: "emma_wilson", email: "emma@example.com"),
        User(id: 3, username: "james_brown", email: "james@example.com"),
        User(id: 4, username: "sophia_ross", email: "sophia@example.com"),
        User(id: 5, username: "liam_green", email: "liam@example.com"),
        User(id: 6, username: "olivia_clark", email: "olivia@example.com"),
        User(id: 7, username: "noah_miller", email: "noah@example.com"),
        User(id: 8, username: "ava_taylor", email: "ava@example.com"),
        User(id: 9, username: "ethan_davis", email: "ethan@example.com"),
        User(id: 10, username: "mia_walker", email: "mia@example.com")
    ]
}
