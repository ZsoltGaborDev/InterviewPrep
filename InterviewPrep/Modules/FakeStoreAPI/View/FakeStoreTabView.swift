//
//  FakeStoreTabView.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import SwiftUI

struct FakeStoreTabView: View {
    private enum StoreTab: Hashable {
        case products
        case users
    }

    @State private var selectedTab: StoreTab = .products

    var body: some View {
        TabView(selection: $selectedTab) {
            ProductsView()
                .tabItem {
                    Label("Products", systemImage: "cart")
                }
                .tag(StoreTab.products)
            
            Spacer()
            
            UsersView()
                .tabItem {
                    Label("Users", systemImage:"person")
                }
                .tag(StoreTab.users)
        }
    }
}

#Preview {
    FakeStoreTabView()
}
