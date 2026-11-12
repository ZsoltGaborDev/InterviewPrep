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
        List {
            ForEach(viewModel.users) { user in
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

#Preview {
    UsersView()
}
