//
//  ContactRawView.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 07/11/2026.
//

import SwiftUI

struct ContactRawView: View {

    let contact: Contact
    
    var body: some View {
        HStack {
            Text(contact.initials)
                .frame(width: 48, height: 48)
                .background(Color(.systemGray4))
                .foregroundStyle(.white)
                .clipShape(.circle)
            
            VStack(alignment: .leading) {
                Text("\(contact.firstName) \(contact.lastName)")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text(contact.email)
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            Spacer()
        }
    }
}

#Preview {
    ContactRawView(
        contact: .init(
            id: "1",
            firstName: "Michael",
            lastName: "Jordan",
            email: "test@gmail.com"
        )
    )
}
