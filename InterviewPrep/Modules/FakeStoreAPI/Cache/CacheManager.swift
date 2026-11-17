//
//  CacheManager.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 17/11/2026.
//

import Foundation

protocol CacheManagerProtocol {
    func getData<T: Codable>(as type: T.Type) throws -> [T]
    func saveData<T: Codable>(_ data: [T])
    func invalidate()
    
    var filename: String { get }
}


struct CacheManager: CacheManagerProtocol {
    let filename: String
    
    init(filename: String) {
        self.filename = filename
    }
}

extension CacheManagerProtocol {
    var docuementDirectoryURL: URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    func getData<T: Codable>(as type: T.Type) throws -> [T] {
        guard let fileURL = docuementDirectoryURL?.appending(path: filename) else { return [] }
        guard FileManager.default.fileExists(atPath: fileURL.path()) else { return [] }
        
        let data = try Data(contentsOf: fileURL)
        return try JSONDecoder().decode([T].self, from: data)
    }
    
    func saveData<T: Codable>(_ data: [T]) {
        guard let fileURL = docuementDirectoryURL?.appending(path: filename) else { return }
        do {
            let data = try JSONEncoder().encode(data)
            try data.write(to: fileURL)
        } catch {
            print("DEBUG: Failed to save products to cache with error: \(error)")
        }
    }
    
    func invalidate() {
        guard let fileURL = docuementDirectoryURL?.appending(path: filename) else { return }
        
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch {
            print("DEBUG: Failed to invalidate cache with error: \(error)")
        }
    }
}
