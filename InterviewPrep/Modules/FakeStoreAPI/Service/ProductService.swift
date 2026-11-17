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
    private let downloader: HTTPDataDownloaderProtocol
    
    init(downloader: HTTPDataDownloaderProtocol = HTTPDataDownloader(endpoint: .products, cache: CacheManager(filename: "products.json"))) {
        self.downloader = downloader
    }
    
    func fetchProducts() async throws -> [Product] {
        return try await downloader.fetchData(as: Product.self)
    }
}

struct MockProductService: ProductServiceProtocol {
    func fetchProducts() async throws -> [Product] {
        return Product.mockProducts
    }
}
