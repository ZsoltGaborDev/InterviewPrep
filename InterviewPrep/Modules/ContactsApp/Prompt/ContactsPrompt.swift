//
//  ContactsPrompt.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 07/11/2026.
//

/*
 *** OVERVIEW ***
 Take Home / Live Interview Example
 
 Live Setting - 1-2 hours of live coding. Get as far as you can
    Take Home - Complete all tasks
 
 Tests your knowledge of:
     - Data modeling
     - Navigation
     - App architecture
     - CRUD Operations and data persistence between views
     - General SwiftUI functionality
 ______________________________________________________
 
 *** PROBLEM STATEMENT ***
 
 Design and implement a simple Contacts App using SwiftUI that provides basic
 functionality similar to the native iPhone Contacts App.
 
 Requirements:
 
 Contact Data: ✅
     - First name
     - Last name
     - Email
 
 View Contacts:
     - Display a vertical scrollable list of contacts. ✅
     - Display contact initials in a circular view for each contact. ✅
     - Next to the initial view, display contact name, last name and email.See UI ✅
     
 Add a Contacts:
     - provide a screen where can addnew contacts by entering a first name, last name and email.✅
 
 Edit a Contact:
     - Allow users to edit an existing contact's detail.✅ 
     - Enable save button only if changes have been made to contact.(BONUS) ✅ 
     - If changes have been made and user tries to exit, show and alert confirmation warning.(BONUS) ✅
 
 Search for contacts:✅
     - Add a search bar to filter contacts ✅
     - Search should be on user's name or email ✅
 
 Delete contact:
     - Add deletion button on contact detail screen ✅
     - Add confirmation alert for contact deletion in edit screen (BONUS) ✅
     - Swipe to delete (BONUS FEATURE)
 
 Navigation Logic: ✅
     - Add contact should be a modal sheet ✅
     - Edit contact should be a navigation push to a contact detail screen ✅ 
 
 Te contact list should persist for the session (no need for long-term storage like Core Data).
 
 Follow-Up Questions
    1. How would you persist the contact list between app sessions?
    Answer: Use Core/Swift Data, file-storage with FileManager or SQLite.
 
    2. Should we use remote data base for this application?
    Answer: Potentially yes, simply to serve as backup storagge in case an user were to lose their device.
 
    3. How would you handle large list of contacts for performance?
    Answer: Pagination
 */
