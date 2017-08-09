//
//  OppositeCatStrategy.swift
//  PrisonersDilemma
//
//  Created by Dylan Elliott on 8/8/17.
//  Copyright © 2017 Dylan Elliott. All rights reserved.
//

import UIKit

class OppositeCatStrategy: PrisonerStrategy {
    
    override func nextMove(opponentLastMove: Move?) -> Move {
        if let lastMove = opponentLastMove {
            return lastMove == .Cooperate ? .Dissent : .Cooperate
        } else {
            return .Cooperate
        }
    }
    
    override class func displayName() -> String {
        return "Opposite Copycat"
    }

}
