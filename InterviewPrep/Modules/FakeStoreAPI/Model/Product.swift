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

extension Product {
    static let mockProducts: [Product] = [
        Product(
            id: 1, title: "Wireless Headphones", price: 79.99,
            description: "Comfortable wireless headphones with noise cancellation.",
            category: "Electronics",
            image: "https://placehold.co/600x600/png?text=Wireless+Headphones"
        ),
        Product(
            id: 2, title: "Smart Watch", price: 149.99,
            description: "Track your activity, heart rate, and daily notifications.",
            category: "Electronics",
            image: "https://placehold.co/600x600/png?text=Smart+Watch"
        ),
        Product(
            id: 3, title: "Portable Speaker", price: 45.50,
            description: "Compact Bluetooth speaker with up to 12 hours of playback.",
            category: "Electronics",
            image: "https://placehold.co/600x600/png?text=Portable+Speaker"
        ),
        Product(
            id: 4, title: "Cotton T-Shirt", price: 19.99,
            description: "Soft cotton T-shirt with a relaxed fit for everyday wear.",
            category: "Clothing",
            image: "https://placehold.co/600x600/png?text=Cotton+T-Shirt"
        ),
        Product(
            id: 5, title: "Denim Jacket", price: 69.99,
            description: "Classic denim jacket with button closures and chest pockets.",
            category: "Clothing",
            image: "https://placehold.co/600x600/png?text=Denim+Jacket"
        ),
        Product(
            id: 6, title: "Running Shoes", price: 89.95,
            description: "Lightweight running shoes with breathable mesh and cushioned soles.",
            category: "Footwear",
            image: "https://placehold.co/600x600/png?text=Running+Shoes"
        ),
        Product(
            id: 7, title: "Everyday Backpack", price: 54.99,
            description: "Durable backpack with a padded laptop compartment.",
            category: "Accessories",
            image: "https://placehold.co/600x600/png?text=Everyday+Backpack"
        ),
        Product(
            id: 8, title: "Leather Wallet", price: 34.50,
            description: "Slim leather wallet with six card slots and a cash pocket.",
            category: "Accessories",
            image: "https://placehold.co/600x600/png?text=Leather+Wallet"
        ),
        Product(
            id: 9, title: "Ceramic Coffee Mug", price: 12.99,
            description: "A 350 ml ceramic mug with a comfortable handle.",
            category: "Home",
            image: "https://placehold.co/600x600/png?text=Ceramic+Coffee+Mug"
        ),
        Product(
            id: 10, title: "LED Desk Lamp", price: 39.99,
            description: "Adjustable desk lamp with three brightness levels.",
            category: "Home",
            image: "https://placehold.co/600x600/png?text=LED+Desk+Lamp"
        ),
        Product(
            id: 11, title: "Insulated Water Bottle", price: 24.95,
            description: "A reusable 750 ml stainless steel bottle with a leakproof lid.",
            category: "Outdoors",
            image: "https://placehold.co/600x600/png?text=Insulated+Water+Bottle"
        ),
        Product(
            id: 12, title: "Yoga Mat", price: 29.99,
            description: "Cushioned exercise mat with a textured, nonslip surface.",
            category: "Fitness",
            image: "https://placehold.co/600x600/png?text=Yoga+Mat"
        ),
        Product(
            id: 13, title: "Resistance Band Set", price: 22.50,
            description: "Five resistance bands for stretching and strength training.",
            category: "Fitness",
            image: "https://placehold.co/600x600/png?text=Resistance+Band+Set"
        ),
        Product(
            id: 14, title: "Hardcover Notebook", price: 14.99,
            description: "A lined notebook with 200 pages and an elastic closure.",
            category: "Stationery",
            image: "https://placehold.co/600x600/png?text=Hardcover+Notebook"
        ),
        Product(
            id: 15, title: "Wooden Phone Stand", price: 17.99,
            description: "Minimal wooden stand for keeping your phone upright on a desk.",
            category: "Accessories",
            image: "https://placehold.co/600x600/png?text=Wooden+Phone+Stand"
        )
    ]
}
