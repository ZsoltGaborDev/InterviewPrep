//
//  UserService.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 17/11/2026.
//

import Foundation

protocol UserSeviceProtocol {
    func fetchUsers() async throws -> [User]
}

struct UserService: UserSeviceProtocol {
    private let downloader: HTTPDataDownloaderProtocol
    
    init(downloader: HTTPDataDownloaderProtocol = HTTPDataDownloader(endpoint: .users, cache: CacheManager(filename: "users.json"))) {
        self.downloader = downloader
    }
    
    func fetchUsers() async throws -> [User] {
        return try await downloader.fetchData(as: User.self)
    }
}
