//
//  QuizAppView.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 09/11/2026.
//

import SwiftUI

struct QuizAppView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("What is the main function of a view Model in MVVM architecture")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Select an answer below")
                .foregroundStyle(.gray)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 120)
        .padding()
        
        VStack(alignment: .leading, spacing: 12) {
            Text("Question 1 / 6")
                .font(.subheadline)
                .padding(.horizontal)
            Divider()
        }
        .padding(.bottom)
        
        ForEach(0..<4, id: \.self) { choice in
            Button {
                
            } label: {
                Text("Some test asnwer for now...")
                    .padding(.horizontal)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.black)
                    .frame(width: 360, height: 52, alignment: .leading)
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                    }
            }
            
        }
        Spacer()
        
        Button {
            
        } label: {
            Text("Submit")
                .font(.headline)
                .frame(width: 360, height: 52)
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
}

#Preview {
    QuizAppView()
}

/*
 Prompt:
 
 Build a quiz application.
  - Users should be presented with a question that has 4 potential answers
  - Users should be able to select an answer and navogate to the next question until completion
  - Show the question number the user is currently on
  - Show a completion view with the option to view results or start quiz over.
 
 Architecture:
 MVVM
 
 
 */
