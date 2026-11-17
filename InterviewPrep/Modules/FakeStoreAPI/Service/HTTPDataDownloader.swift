//
//  HTTPDataDownloader.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 13/11/2026.
//

import Foundation

protocol HTTPDataDownloaderProtocol {
    func fetchData<T: Codable>(as type: T.Type) async throws -> [T]
}

class HTTPDataDownloader: HTTPDataDownloaderProtocol {
    private let baseURL = "https://fakestoreapi.com"
    private let cache: CacheManager?
    private let endpoint: FakeStoreAPIEndpoint
    private var lastFetchedTime: Date?
    private let refreshInterval: TimeInterval = 60 * 10 // 10 minutes
    private let userDefaultsLastFetchedTimeKey: String
    
    init(endpoint: FakeStoreAPIEndpoint, cache: CacheManager? = nil) {
        self.endpoint = endpoint
        self.cache = cache
        
        self.userDefaultsLastFetchedTimeKey = endpoint.path
        getLastFetchedTime()
    }
    
    func fetchData<T: Codable>(as type: T.Type) async throws -> [T] {
        if !needRefresh, let cache {
            print("Got data from cache")
            return try cache.getData(as: type)
        }
        print("Got data from API")
        let url = try buildURL()
        
        let (data, response) = try await URLSession.shared.data(from: url)
        try validateResponse(response)
        
        let result = try JSONDecoder().decode([T].self, from: data)
        
        if let cache {
            saveLastFechedTime()
            cache.saveData(result)
        }
        
        return result
    }
    
    func buildURL() throws -> URL {
        guard var components = URLComponents(string: baseURL) else { throw APIError.invalidURL }
        components.path = endpoint.path
        
        guard let url = components.url else { throw APIError.invalidURL }
        return url
    }
    
    private func validateResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
    }
    
    private var needRefresh: Bool {
        guard let lastFetchedTime else { return true }
        return Date().timeIntervalSince(lastFetchedTime) >= refreshInterval
    }
    
    private func saveLastFechedTime() {
        UserDefaults.standard.set(Date(), forKey: userDefaultsLastFetchedTimeKey)
    }

    private func getLastFetchedTime() {
        self.lastFetchedTime = UserDefaults.standard.value(forKey: userDefaultsLastFetchedTimeKey) as? Date
    }
}

enum FakeStoreAPIEndpoint {
    case products
    case users
    
    var path: String {
        switch self {
        case .products:
            "/products"
        case .users:
            "/users"
        }
    }
}
/// Common API error types used by the Fake Store networking layer.
enum APIError: Error, LocalizedError {
    case invalidURL

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL constructed for the request is invalid."
        }
    }
}

