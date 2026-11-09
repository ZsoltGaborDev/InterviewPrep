//
//  AddContactView.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 08/11/2026.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(ContactsViewModel.self) var viewModel
    
    @State var fistName = ""
    @State var lastName = ""
    @State var email = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("First name", text: $fistName)
                TextField("Last name", text: $lastName)
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.red)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addContact()
                        dismiss()
                    } label: {
                        Text("Save")
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Add contact")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private extension AddContactView {
    func addContact() {
        let contact = Contact(
            id: UUID().uuidString,
            firstName: fistName,
            lastName: lastName,
            email: email
        )
        
        viewModel.addContact(contact)
    }
}

#Preview {
    AddContactView()
        .environment(ContactsViewModel())
}
