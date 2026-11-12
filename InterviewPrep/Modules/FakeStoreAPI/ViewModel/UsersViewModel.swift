//
//  UsersViewModel.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import Foundation

@Observable
class UsersViewModel {
    var users = [User]()
    
    init() {
        self.users = User.mockUsers
    }
}
