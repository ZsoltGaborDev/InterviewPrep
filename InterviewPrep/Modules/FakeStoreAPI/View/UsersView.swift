//
//  UsersView.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import SwiftUI

struct UsersView: View {
    @State var viewModel = UsersViewModel()
    
    var body: some View {
        Group {
            switch viewModel.loadingState {
            case .loading:
                ProgressView()
            case .empty:
                ContentUnavailableView("No users", image: "person")
            case .error(let error):
                Text(error.localizedDescription)
            case .completed(let users):
                List {
                    ForEach(users) { user in
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
            }
        }
        .task {
            await viewModel.fetchUsers()
        }
    }
}

#Preview {
    UsersView()
}
