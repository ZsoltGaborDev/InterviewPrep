//
//  FakeStoreTabView.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import SwiftUI

struct FakeStoreTabView: View {
    var body: some View {
        TabView {
            ProductsView()
                .tabItem {
                    Label("Products", systemImage: "cart")
                }
            Spacer()
            
            UsersView()
                .tabItem {
                    Label("Users", systemImage:"person")
                }
        }
    }
}

#Preview {
    FakeStoreTabView()
}
