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

class ProductService: ProductServiceProtocol {
    private let urlString = "https://fakestoreapi.com/products"
    private let cache = ProductsCache()
    private let refreshInterval: TimeInterval = 60 * 10 // 10 minutes
    private var lastFetchedTime: Date?
    
    init() {
        self.getLastFetchedTime()
    }
    
    private var needRefresh: Bool {
        guard let lastFetchedTime else { return true }
        return Date().timeIntervalSince(lastFetchedTime) >= refreshInterval
    }
    
    func fetchProducts() async throws -> [Product] {
        if !needRefresh, let cachedProducts = try cache.getProducts() {
            return cachedProducts
        }
        
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        try validateResponse(response)
        
        saveLastFechedTime()
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
    
    private func saveLastFechedTime() {
        UserDefaults.standard.set(Date(), forKey: "lastFechedTime")
    }
    
    private func getLastFetchedTime() {
        self.lastFetchedTime = UserDefaults.standard.value(forKey: "lastFechedTime") as? Date
    }
}

struct MockProductService: ProductServiceProtocol {
    func fetchProducts() async throws -> [Product] {
        return Product.mockProducts
    }
}
