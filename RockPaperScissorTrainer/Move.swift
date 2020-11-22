//
//  Move.swift
//  RockPaperScissorTrainer
//
//  Created by Michele Volpato on 22/11/2020.
//

import Foundation

enum Move: CaseIterable {
    case rock, paper, scissors

    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "🖐"
        case .scissors:
            return "✌️"
        }
    }

    func winAgainst(_ otherMove: Move) -> Bool {
        switch self {
        case .rock:
            return otherMove == .scissors
        case .paper:
            return otherMove == .rock
        case .scissors:
            return otherMove == .paper
        }
    }

    func loseAgainst(_ otherMove: Move) -> Bool {
        switch self {
        case .rock:
            return otherMove == .paper
        case .paper:
            return otherMove == .scissors
        case .scissors:
            return otherMove == .rock
        }
    }

    static func randomMove() -> Move {
        return Self.allCases[Int.random(in: 0..<3)]
    }
}
