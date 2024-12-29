//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Егор Шишло on 22.12.24.
//

import Foundation


final class StatisticService: StatisticServiceProtocol {
    
    private enum Keys: String {
        case correct
        case bestGame
        case gamesCount
        case total
        case totalCorrectAnswers
        case totalQuestions
        case date
    }
    
    private let storage = UserDefaults.standard
    
    var gamesCount: Int {
        get {
            storage.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    var bestGame: GameResult {
        get {
            let correct = storage.integer(forKey: Keys.correct.rawValue)
            let total = storage.integer(forKey: Keys.total.rawValue)
            let date = storage.object(forKey: Keys.date.rawValue) as? Date ?? Date()
            return GameResult(correct: correct, total: total, date: date)
        }
        set {
            storage.set(newValue.correct, forKey: Keys.correct.rawValue)
            storage.set(newValue.total, forKey: Keys.total.rawValue)
            storage.set(newValue.date, forKey: Keys.date.rawValue)
        }
        
    }
    var totalCorrectAnswers: Int {
        get {
            storage.integer(forKey: Keys.totalCorrectAnswers.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.totalCorrectAnswers.rawValue)
        }
    }
    
    var totalQuestions: Int {
        get {
            storage.integer(forKey: Keys.totalQuestions.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.totalQuestions.rawValue)
        }
    }
    
    var totalAccuracy: Double {
        if totalQuestions == 0 {
            return 0.0
        }else {
            return Double(totalCorrectAnswers) / Double(totalQuestions) * 100
        }
    }
    
    func store(correct count: Int, total amount: Int) {
        let newRecord = GameResult(correct: count, total: amount, date: Date())
        if newRecord.isBetterThan(bestGame) {
            bestGame = newRecord
        }
        gamesCount += 1
        totalCorrectAnswers += count
        totalQuestions += amount
    }
    
    
}
