//
//  RpsRobot.swift
//  RPS
//
//  Created by Ryo Togashi on 2019-08-18.
//  Copyright © 2019 Ryo Togashi. All rights reserved.
//

import Foundation
import GameplayKit


enum RPSResult {
    case win
    case lose
    case draw
}

struct RpsRobot: RPS {
    func randomSign() -> Sign {
        let sign = GKRandomDistribution(lowestValue: 0, highestValue: 2).nextInt()
        if sign == 0 {
            return .rock
        } else if sign == 1 {
            return .paper
        } else {
            return .scissors
        }
    }
}

protocol RPS {
    func randomSign() -> Sign
}
