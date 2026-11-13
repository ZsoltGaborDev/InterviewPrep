//
//  ProductsViewModel.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import Foundation

@Observable
class ProductsViewModel {
    let service: ProductServiceProtocol
    var loadingState: ContentLoadingState<Product> = .loading
    
    init(service: ProductServiceProtocol = ProductService()) {
        self.service = service
    }
    
    func fetchProducts() async {
        do {
            let products = try await service.fetchProducts()
            self.loadingState = products.isEmpty ? .empty : .completed(data: products)
        } catch {
            self.loadingState = .error(error: error)
            print("DEBUG: Failed fetch product with error: \(error)")
        }
    }
}
