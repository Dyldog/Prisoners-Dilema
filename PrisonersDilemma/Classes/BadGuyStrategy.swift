//
//  BadGuyStrategy.swift
//  PrisonersDilemma
//
//  Created by Dylan Elliott on 8/8/17.
//  Copyright © 2017 Dylan Elliott. All rights reserved.
//

import UIKit

class BadGuyStrategy: PrisonerStrategy {
    override func nextMove(opponentLastMove: Move?) -> Move {
        return .Dissent
    }
    
    override class func displayName() -> String {
        return "Bad Guy"
    }
}
