//
//  EditContactView.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 08/11/2026.
//

import SwiftUI

struct EditContactView: View {
    @Environment(ContactsViewModel.self) var viewModel
    @Environment(\.dismiss) var dismiss
    
    @State var contact: Contact
    @State var contactDidChange = false
    @State var showExitConfirmation = false
    @State var showDeleteConfirmation = false

    private let originalContact: Contact
    
    init(contact: Contact) {
        _contact = State(initialValue: contact)
        self.originalContact = contact
    }
    
    var body: some View {
        VStack {
            Form {
                TextField("First name", text: $contact.firstName)
                TextField("Last name", text: $contact.lastName)
                TextField("Email", text: $contact.email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            
            Button(action: {
                onDelete()
            }, label: {
                Text("Delete")
                    .foregroundStyle(.white)
                    .frame(width: 300, height: 48)
                    .background(.red)
                    .cornerRadius(10)
                    .clipped()
                    
            })
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    onCancel()
                } label: {
                    Text("Cancel")
                        .foregroundStyle(.red)
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    updateContact()
                } label: {
                    Text("Save")
                        .font(.headline)
                }
                .disabled(!contactDidChange)
            }
        }
        .onChange(of: contact, { oldValue, newValue in
            contactDidChange = originalContact != newValue
        })
        .alert("Unsaved changes", isPresented: $showExitConfirmation, actions: {
            Button("Stay", role: .cancel) { }
            Button("Discard changed", role: .destructive) { dismiss() }
        })
        .alert("Delete Contact", isPresented: $showDeleteConfirmation, actions: {
            Button("Cancel", role: .cancel) { }
            Button("Delete", role: .destructive) { deleteContact() }
        })
        .navigationTitle("Edit contact")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

private extension EditContactView {
    func updateContact() {
        viewModel.updateContact(contact)
        dismiss()
    }
    
    func deleteContact() {
        viewModel.deleteContact(contact)
        dismiss()
    }
    
    func onCancel() {
        if contactDidChange {
            showExitConfirmation = true
        } else {
            dismiss()
        }
    }
    
    func onDelete() {
        showDeleteConfirmation = true
    }
}

#Preview {
    EditContactView(
        contact: .init(
            id: "1",
            firstName: "Michael",
            lastName: "Jordan",
            email: "test@gmail.com"
        )
    )
    .environment(ContactsViewModel())
}
