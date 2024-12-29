//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Егор Шишло on 20.12.24.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
}
