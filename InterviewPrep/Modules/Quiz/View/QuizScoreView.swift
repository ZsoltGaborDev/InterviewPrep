//
//  QuizScoreView.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 11/11/2026.
//

import SwiftUI

struct QuizScoreView: View {
    @Environment(\.dismiss) var dimiss
    @Environment(QuizViewModel.self) var viewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack {
                HStack {
                    Text("You scored")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    Spacer()
                    Button {
                        dimiss()
                    } label: {
                        ZStack {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.white)
                                .imageScale(.large)
                        }
                    }
                    

                }
                
                Text("\(viewModel.quizScore.description)%")
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
            }
            .padding(.vertical, 16)
            .padding()
            .background(.blue)
            
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Statistics")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                
                Form {
                    HStack {
                        Text("Correct answers")
                        Spacer()
                        Text("\(viewModel.numCorrectAnswers)/\(viewModel.quiz.questions.count)")
                    }
                    
                    HStack {
                        Text("Inorrect answers")
                        Spacer()
                        Text("\(viewModel.numIncorrectAnswers)/\(viewModel.quiz.questions.count)")
                            .foregroundStyle(.red)
                    }
                }
                .cornerRadius(24)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    QuizScoreView()
        .environment(QuizViewModel())
}
