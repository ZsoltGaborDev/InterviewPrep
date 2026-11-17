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
    private let cache = CacheManager(filename: "users.json")
    private var lastFetchedTime: Date?
    private let refreshInterval: TimeInterval = 60 * 10 // 10 minutes
    
    init(downloader: HTTPDataDownloaderProtocol = HTTPDataDownloader()) {
        self.downloader = downloader
        self.getLastFetchedTime()
    }
    
    func fetchUsers() async throws -> [User] {
        if !needRefresh {
            print("Got users from cache..")
            return try cache.getData(as: User.self)
        }
        print("Got users from API..")
        let users = try await downloader.fetchData(as: User.self, from: .users)
        saveLastFechedTime()
        cache.saveData(users)
        return users
    }
    
    private var needRefresh: Bool {
        guard let lastFetchedTime else { return true }
        return Date().timeIntervalSince(lastFetchedTime) >= refreshInterval
    }
    
    private func saveLastFechedTime() {
        UserDefaults.standard.set(Date(), forKey: "lastFechedTime")
    }
    
    private mutating func getLastFetchedTime() {
        self.lastFetchedTime = UserDefaults.standard.value(forKey: "lastFechedTime") as? Date
    }
}
