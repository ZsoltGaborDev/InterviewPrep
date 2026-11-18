//
//  UsersView.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import SwiftUI

struct UsersView: View {
    @State private var viewModel = UsersViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.loadingState {
                case .loading:
                    ProgressView()
                case .empty:
                    ContentUnavailableView("No users", image: "person")
                case .error(let error):
                    Text(error.localizedDescription)
                case .completed:
                    List {
                        ForEach(filteredUsers) { user in
                            HStack(spacing: 16) {
                                Text("\(user.id)")
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    /*@START_MENU_TOKEN@*/Text(user.username)/*@END_MENU_TOKEN@*/
                                    Text(user.email)
                                        .foregroundStyle(.gray)
                                }
                            }
                            .font(.subheadline)
                        }
                    }
                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic), prompt: "Search for users..")
                }
            }
            .navigationTitle("Users")
            .task {
                await viewModel.fetchUsers()
            }
        }
    }
}

private extension UsersView {
    var filteredUsers: [User] {
        guard case .completed(let users) = viewModel.loadingState else { return [] }
        guard !searchText.isEmpty else { return users }
        
        return users.filter { user in
            user.username.localizedCaseInsensitiveContains(searchText) ||
            user.email.localizedCaseInsensitiveContains(searchText)
        }
    }
}

#Preview {
    UsersView()
}
