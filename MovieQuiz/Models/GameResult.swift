//
//  GameResult.swift
//  MovieQuiz
//
//  Created by Егор Шишло on 22.12.24.
//

import Foundation

struct GameResult {
    let correct: Int //количество правильных ответов,
    let total: Int //количество вопросов квиза,
    let date: Date //дату завершения раунда.
    func isBetterThan(_ another: GameResult) -> Bool{
        correct > another.correct
    }
}
