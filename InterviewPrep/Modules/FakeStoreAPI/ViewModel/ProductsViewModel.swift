//
//  ProductsViewModel.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import Foundation

@Observable
class ProductsViewModel {
    private let service: ProductServiceProtocol
    var products: [Product]
    
    init(service: ProductServiceProtocol = ProductService()) {
        self.products = Product.mockProducts
        self.service = service
    }
    
    func fetchProducts() async {
        do {
            self.products = try await service.fetchProducts()
        } catch {
            print("DEBUG: Failed fetch product with error: \(error)")
        }
    }
}
