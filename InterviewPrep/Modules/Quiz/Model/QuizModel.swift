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

extension QuizModel {
    static let mock = QuizModel(questions: [
        Question(
            prompt: "What is the capital of Italy?",
            choices: ["Rome", "Paris", "Madrid", "Berlin"],
            answer: "Rome"
        ),
        Question(
            prompt: "Which planet is known as the Red Planet?",
            choices: ["Venus", "Mars", "Jupiter", "Saturn"],
            answer: "Mars"
        ),
        Question(
            prompt: "How many sides does a hexagon have?",
            choices: ["Five", "Six", "Seven", "Eight"],
            answer: "Six"
        ),
        Question(
            prompt: "Who painted the Mona Lisa?",
            choices: [
                "Vincent van Gogh",
                "Pablo Picasso",
                "Leonardo da Vinci",
                "Claude Monet"
            ],
            answer: "Leonardo da Vinci"
        ),
        Question(
            prompt: "Which is the largest ocean on Earth?",
            choices: ["Atlantic", "Indian", "Arctic", "Pacific"],
            answer: "Pacific"
        ),
        Question(
            prompt: "What is the chemical symbol for gold?",
            choices: ["Ag", "Au", "Fe", "Cu"],
            answer: "Au"
        ),
        Question(
            prompt: "How many minutes are in two hours?",
            choices: ["60", "90", "120", "180"],
            answer: "120"
        ),
        Question(
            prompt: "Which language is primarily used to build SwiftUI apps?",
            choices: ["Java", "Python", "Swift", "Kotlin"],
            answer: "Swift"
        ),
        Question(
            prompt: "Which animal is the tallest living land animal?",
            choices: ["Elephant", "Giraffe", "Ostrich", "Camel"],
            answer: "Giraffe"
        ),
        Question(
            prompt: "At sea level, what temperature does water freeze at?",
            choices: ["0°C", "10°C", "50°C", "100°C"],
            answer: "0°C"
        )
    ])
}
