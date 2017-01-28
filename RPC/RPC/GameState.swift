//
//  GameState.swift
//  RPC
//
//  Created by Kris Rimar on 24/1/17.
//  Copyright © 2017 Kris Rimar. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    var result: String {
        switch self {
        case .start:
            return "Game starts"
        case .win:
            return "You won!"
        case .lose:
            return "You lost!"
        case .draw:
            return "It's a draw!"
        }
    }
    
}
