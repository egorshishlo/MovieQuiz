//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Егор Шишло on 22.12.24.
//

import Foundation

final class StatisticService: StatisticServiceProtocol {
    private let storage: UserDefaults = .standard
    
    private enum Keys: String {
        case correct
        case bestGame
        case gamesCount
        case total
        case totalAccuracy
    }
    var gamesCount: Int{
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
            let date = storage.object(forKey: "date") as? Date ?? Date()
            return GameResult(correct: correct, total: total, date: date)
        }
        set {
            storage.set(newValue.correct, forKey: Keys.correct.rawValue)
            storage.set(newValue.total, forKey: Keys.total.rawValue)
            storage.set(newValue.date, forKey: "date")
        }
    }
    
    var totalAccuracy: Double {
        get {
            storage.double(forKey: Keys.totalAccuracy.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.totalAccuracy.rawValue)
        }
    }
    
    func store(correct count: Int, total amount: Int) {
        let newRecord = GameResult(correct: count, total: amount, date: Date())
        if newRecord.isBetterThan(bestGame) {
            bestGame = newRecord
        }
        gamesCount += 1
        let totalCorrectAnswers = bestGame.correct + count
        let totalQuestions = bestGame.total + amount
        if totalQuestions != 0 {
            totalAccuracy = Double(totalCorrectAnswers) / Double(totalQuestions) * 100
        }
        
    }
}
