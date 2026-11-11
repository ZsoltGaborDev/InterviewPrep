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
    var currentQuestionIndex = 0
    var showQuizCompletion = false
    var numCorrectAnswers = 0
    
    var numIncorrectAnswers: Int {
        return quiz.questions.count - numCorrectAnswers
    }
    
    var quizScore: Double {
        Double(numCorrectAnswers) / Double(quiz.questions.count) * 100
    }
    
    var currentQuestion: Question {
        return quiz.questions[currentQuestionIndex]
    }
    
    init() {
        self.quiz = QuizModel.mock
    }
    
    func submitAnswer(_ answer: String) {
        //determine if answer is correct
        if answer == currentQuestion.answer {
            numCorrectAnswers += 1
        }
        
        if currentQuestionIndex < quiz.questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            showQuizCompletion = true
        }
    }
    
    func restartQuiz() {
        currentQuestionIndex = 0
        numCorrectAnswers = 0
        showQuizCompletion = false
    }
}
