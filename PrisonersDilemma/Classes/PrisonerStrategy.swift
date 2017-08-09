//
//  PrisonerStrategy.swift
//  PrisonersDilemma
//
//  Created by Dylan Elliott on 8/8/17.
//  Copyright © 2017 Dylan Elliott. All rights reserved.
//

import Foundation

enum Move : String {
    case Cooperate = "C"
    case Dissent = "D"
}

class PrisonerStrategy : NSObject {
    
    override required init() {
        super.init()
    }
    
    class func displayName() -> String {
        return "NOT IMPLEMENTED"
    }
    
    func nextMove(opponentLastMove: Move?) -> Move {
        return .Cooperate
    }
}
