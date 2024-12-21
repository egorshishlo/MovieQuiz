//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Егор Шишло on 21.12.24.
// AI

import Foundation

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: () -> Void
}
