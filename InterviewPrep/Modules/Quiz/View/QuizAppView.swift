//
//  QuizAppView.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 09/11/2026.
//

import SwiftUI

struct QuizAppView: View {
    @State private var viewModel = QuizViewModel()
    @State private var selectedAnswer: String?
    @State private var showScoreView = false

    var body: some View {
        VStack {
            if viewModel.showQuizCompletion {
                QuizCompletionView(showScoreView: $showScoreView)
                    .environment(viewModel)
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.currentQuestion.prompt)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Select an answer below")
                        .foregroundStyle(.gray)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 120)
                .padding()
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Question \(viewModel.currentQuestionIndex + 1) / \(viewModel.quiz.questions.count)")
                        .font(.subheadline)
                        .padding(.horizontal)
                    Divider()
                }
                .padding(.bottom)
                
                ForEach(viewModel.currentQuestion.choices, id: \.self) { choice in
                    Button {
                        self.selectedAnswer = choice
                    } label: {
                        Text(choice)
                            .padding(.horizontal)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.black)
                            .frame(width: 360, height: 52, alignment: .leading)
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(
                                        selectedAnswer == choice ? .blue : .gray,
                                        lineWidth: selectedAnswer == choice ? 3 : 1)
                            }
                    }
                }
                Spacer()
                
                Button {
                    guard let selectedAnswer else {return}
                    viewModel.submitAnswer(selectedAnswer)
                    self.selectedAnswer = nil
                } label: {
                    Text("Submit")
                        .font(.headline)
                        .frame(width: 360, height: 52)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(.rect(cornerRadius: 10))
                }
                .disabled(selectedAnswer == nil)
                .opacity(selectedAnswer == nil ? 0.5 : 1.0)
            }
        }
        .sheet(isPresented: $showScoreView) {
            QuizScoreView()
                .environment(viewModel)
                .presentationDetents([.height(400)])
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
