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
    private let downloader: HTTPDataDownloaderProtocol
    private let cache = ProductsCache()
    private let refreshInterval: TimeInterval = 60 * 10 // 10 minutes
    private var lastFetchedTime: Date?
    
    init(downloader: HTTPDataDownloaderProtocol = HTTPDataDownloader()) {
        self.downloader = downloader
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
        
        let products = try await downloader.fetchData(as: Product.self, from: .products)
        
        saveLastFechedTime()
        cache.saveProducts(products)
        return products
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
