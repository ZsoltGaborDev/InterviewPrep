//
//  QuizModel.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 09/11/2026.
//

import Foundation

struct QuizModel {
    let questions: [Question]
}

struct Question: Identifiable {
    let id = UUID().uuidString
    let prompt: String
    let choices: [String]
    let answer: String
}
