//
//  GoodGuyStrategy.swift
//  PrisonersDilemma
//
//  Created by Dylan Elliott on 8/8/17.
//  Copyright © 2017 Dylan Elliott. All rights reserved.
//

import UIKit

class GoodGuyStrategy:  PrisonerStrategy {
    
    override func nextMove(opponentLastMove: Move?) -> Move {
        return .Cooperate
    }
    
    override class func displayName() -> String {
        return "Good Guy"
    }

}
