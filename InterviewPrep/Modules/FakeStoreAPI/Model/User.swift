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

/*
 {
 "id": 0,
 "username": "string",
 "email": "string",
 "password": "string"
 }
 */
