//
//  Contact.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 07/11/2026.
//

import Foundation

struct Contact: Identifiable, Hashable {
    let id: String
    var firstName: String
    var lastName: String
    var email: String
    
    var initials: String {
        let first = firstName.prefix(1)
        let last = lastName.prefix(1)
        
        return String(first + last)
    }
}

/*
 
 ** NOTES **
  - Added proprieties that waren't listed in prompt but are necessary for this app
  - Correct protocol conformances
  - Displayed knowledge of constants VS variables
 
 */
