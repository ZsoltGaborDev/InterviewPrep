//
//  ContactsView.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 07/11/2026.
//

import SwiftUI

struct ContactsView: View {
    @State private var viewModel = ContactsViewModel()
    @State private var searchText = ""
    @State private var showAddContactView = false
    
    private var searchResults: [Contact] {
        return viewModel.searchResults(for: searchText)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults) { contact in
                    NavigationLink(value: contact) {
                        ContactRawView(contact: contact)
                            .swipeActions {
                                Button {
                                    withAnimation {
                                        viewModel.deleteContact(contact)
                                    }
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .tint(.red)
                            }
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search...")
            .navigationTitle("Conatcts")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddContactView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .sheet(isPresented: $showAddContactView) {
                AddContactView()
                    .environment(viewModel)
                    .presentationDetents([.height(300)])
            }
            .navigationDestination(for: Contact.self) { contact in
                EditContactView(contact: contact)
                    .environment(viewModel)
            }
        }
    }
}

#Preview {
    ContactsView()
}
