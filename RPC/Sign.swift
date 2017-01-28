//
//  Sign.swift
//  RPC
//
//  Created by Kris Rimar on 24/1/17.
//  Copyright © 2017 Kris Rimar. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "👋"
        case .scissors:
            return "✌️"
        }
    }
}

func gameResult(player1: Sign, player2: Sign) -> GameState {
    if (player1 == .rock && player2 == .paper) {
        return .lose
    } else if (player1 == .rock && player2 == .scissors) {
        return .win
    } else if (player1 == .paper && player2 == .rock) {
        return .win
    } else if (player1 == .paper && player2 == .scissors) {
        return .lose
    } else if (player1 == .scissors && player2 == .paper) {
        return .win
    } else if (player1 == .scissors && player2 == .rock) {
        return .win
    }
    return .draw
}
