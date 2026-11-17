//
//  HTTPDataDownloader.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 13/11/2026.
//

import Foundation

protocol HTTPDataDownloaderProtocol {
    func fetchData<T: Codable>(as type: T.Type, from endpoint: FakeStoreAPIEndpoint) async throws -> [T]
}

struct HTTPDataDownloader: HTTPDataDownloaderProtocol {
    private let baseURL = "https://fakestoreapi.com"
    
    func fetchData<T: Codable>(as type: T.Type, from endpoint: FakeStoreAPIEndpoint) async throws -> [T] {
        let url = try buildURL(endpoint: endpoint)
        
        let (data, response) = try await URLSession.shared.data(from: url)
        try validateResponse(response)
        
        let result = try JSONDecoder().decode([T].self, from: data)
        return result
    }
    
    func buildURL(endpoint: FakeStoreAPIEndpoint) throws -> URL {
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

