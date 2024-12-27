//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Егор Шишло on 22.12.24.
//

import Foundation

protocol StatisticServiceProtocol {
    var gamesCount: Int { get }
    var bestGame: GameResult { get }
    var totalAccuracy: Double { get }
    
    func store(correct count: Int, total amount: Int)
}
