//
//  ProductsCache.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 13/11/2026.
//

import Foundation

struct ProductsCache {
    private let docuementDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    
    private let filename = "products.json"
    
    func getProducts() throws -> [Product]? {
        guard let fileURL = docuementDirectoryURL?.appending(path: filename) else { return nil }
        guard FileManager.default.fileExists(atPath: fileURL.path()) else { return nil }
        
        let data = try Data(contentsOf: fileURL)
        return try JSONDecoder().decode([Product].self, from: data)
        
    }
    
    func saveProducts(_ products: [Product]) {
        guard let fileURL = docuementDirectoryURL?.appending(path: filename) else { return }
        do {
            let data = try JSONEncoder().encode(products)
            try data.write(to: fileURL)
        } catch {
            print("DEBUG: Failed to save products to cache with error: \(error)")
        }
    }
    
    func invalidateCahce() {
        guard let fileURL = docuementDirectoryURL?.appending(path: filename) else { return }
        
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch {
            print("DEBUG: Failed to invalidate cache with error: \(error)")
        }
    }

}
