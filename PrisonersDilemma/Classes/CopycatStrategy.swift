//
//  CopycatStrategy.swift
//  PrisonersDilemma
//
//  Created by Dylan Elliott on 8/8/17.
//  Copyright © 2017 Dylan Elliott. All rights reserved.
//

import UIKit

class CopycatStrategy: PrisonerStrategy {
    override func nextMove(opponentLastMove: Move?) -> Move {
        return opponentLastMove ?? .Cooperate
    }
    
    override class func displayName() -> String {
        return "Copycat"
    }
}
