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
            try Task.checkCancellation()
            self.loadingState = products.isEmpty ? .empty : .completed(data: products)
        } catch is CancellationError {
            // SwiftUI cancels the task when this view disappears.
        } catch let error as URLError where error.code == .cancelled {
            // URLSession reports task cancellation as URLError.cancelled.
        } catch {
            self.loadingState = .error(error: error)
            print("DEBUG: Failed fetch product with error: \(error)")
        }
    }
}
