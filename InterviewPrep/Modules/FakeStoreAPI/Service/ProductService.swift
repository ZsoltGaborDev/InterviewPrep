//
//  ProductService.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import Foundation

protocol ProductServiceProtocol {
    func fetchProducts() async throws -> [Product]
}

struct ProductService: ProductServiceProtocol {
    
    func fetchProducts() async throws -> [Product] {
        return Product.mockProducts
    }
}
