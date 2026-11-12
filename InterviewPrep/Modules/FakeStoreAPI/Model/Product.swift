//
//  Product.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import Foundation

struct Product: Identifiable, Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
}


/*
 {
 "id": 0,
 "title": string",
 "price": 0.1,
 "description": "string",
 "category": "string",
 "image": "http://example.com"
 }
 */
