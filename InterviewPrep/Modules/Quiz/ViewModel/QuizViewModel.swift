//
//  QuizViewModel.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 09/11/2026.
//

import Foundation

@Observable
class QuizViewModel {
    let quiz: QuizModel
    var currectQuestionIndex = 0
    
    var currentQuestion: Question {
        return quiz.questions[currectQuestionIndex]
    }
    
    init() {
        self.quiz = QuizModel.mock
    }
    
    func submitAnswer(_ answer: String) {
        //determine if answer is correct
        currectQuestionIndex += 1
    }
    
    func restartQuiz() {
        
    }
}
