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
    private var lastFetchedTime: Date?
    
    init(downloader: HTTPDataDownloaderProtocol = HTTPDataDownloader()) {
        self.downloader = downloader
        self.getLastFetchedTime()
    }
    
    func fetchUsers() async throws -> [User] {
        let users = try await downloader.fetchData(as: User.self, from: .users)
        saveLastFechedTime()
        return users
    }
    
    private func saveLastFechedTime() {
        UserDefaults.standard.set(Date(), forKey: "lastFechedTime")
    }
    
    private mutating func getLastFetchedTime() {
        self.lastFetchedTime = UserDefaults.standard.value(forKey: "lastFechedTime") as? Date
    }
}
