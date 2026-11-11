//
//  QuizCompletionView.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 10/11/2026.
//

import SwiftUI

struct QuizCompletionView: View {
    @Environment(QuizViewModel.self) var viewModel
    @Binding var showScoreView: Bool
    
    var body: some View {
        VStack {
            Text("Congratulations, you've completed the quiz!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 4)
            
            Text("Click below to view your results")
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.bottom)
            
            Button {
                showScoreView.toggle()
            } label: {
                Text("View Results")
                    .frame(maxWidth: .infinity, maxHeight: 46)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
            }
            
            Button {
                viewModel.restartQuiz()
            } label: {
                Text("Start Over")
                    .frame(maxWidth: .infinity, maxHeight: 46)
                    .background(.clear)
                    .foregroundStyle(.blue)
                    .cornerRadius(10)
                    .fontWeight(.bold)
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var showScoreView = false
    
    QuizCompletionView(showScoreView: $showScoreView)
        .environment(QuizViewModel())
}
