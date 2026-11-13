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
    private let urlString = "https://fakestoreapi.com/products"
    private let cache = ProductsCache()
    
    func fetchProducts() async throws -> [Product] {
        if let cachedProducts = try cache.getProducts() {
            print("..getting products from cache")
            return cachedProducts
        }
        
        print("..getting products from API")
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        try validateResponse(response)
        
        let products = try JSONDecoder().decode([Product].self, from: data)
        cache.saveProducts(products)
        return products
    }
    
    private func validateResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
    }
}

struct MockProductService: ProductServiceProtocol {
    func fetchProducts() async throws -> [Product] {
        return Product.mockProducts
    }
}
