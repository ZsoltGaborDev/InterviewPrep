//
//  UsersViewModel.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import Foundation

@Observable
class UsersViewModel {
    private let service: UserSeviceProtocol
    var users = [User]()
    var loadingState: ContentLoadingState<User> = .loading
    
    init(service: UserSeviceProtocol = UserService()) {
        self.service = service
        self.users = User.mockUsers
    }
    
    func fetchUsers() async {
        do {
            let users = try await service.fetchUsers()
            try Task.checkCancellation()
            self.loadingState = users.isEmpty ? .empty : .completed(data: users)
        } catch is CancellationError {
            // SwiftUI cancels the task when this view disappears.
        } catch let error as URLError where error.code == .cancelled {
            // URLSession reports task cancellation as URLError.cancelled.
        } catch {
            self.loadingState = .error(error: error)
            print("DEBUG: Failed fetch users with error: \(error)")
        }
    }
}
