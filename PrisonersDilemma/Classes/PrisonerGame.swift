//
//  PrisonerGame.swift
//  PrisonersDilemma
//
//  Created by Dylan Elliott on 8/8/17.
//  Copyright © 2017 Dylan Elliott. All rights reserved.
//

import Foundation

//class PrisonerStrategyRun : NSObject {
//    let strategy : PrisonerStrategy
//    let previousMoves : [Move]
//}

class PrisonerGame: NSObject {
    var currentTurnNum : Int = 0
    
    let strategyA : PrisonerStrategy
    var previousMoveA : Move?
    let strategyB : PrisonerStrategy
    var previousMoveB : Move?
    
    init(firstStrategy: PrisonerStrategy, secondStrategy : PrisonerStrategy) {
        self.strategyA = firstStrategy
        self.strategyB = secondStrategy
        
        super.init()
    }
    
    internal func computeTurnResult(moveA: Move, moveB: Move) -> (Int,Int) {
        let playCost : Int = 1
        let winAmount : Int = 2
        
        var scoreA = 0
        var scoreB = 0
        
        // Cost of playing / cooperating
        
        scoreA -= (moveA == .Cooperate ? playCost : 0)
        scoreB -= (moveB == .Cooperate ? playCost : 0)
        
        // Cost of opponent not playing / dissenting
        
        scoreA += (moveB == .Cooperate ? winAmount : 0)
        scoreB += (moveA == .Cooperate ? winAmount : 0)
        
        return (scoreA, scoreB)
    }
    
    func nextTurn() -> (Int,Int) {
        // Turn code
        let moveA = strategyA.nextMove(opponentLastMove: previousMoveB)
        let moveB = strategyB.nextMove(opponentLastMove: previousMoveA)
        
        let turnResult = computeTurnResult(moveA: moveA, moveB: moveB)
        
        previousMoveA = moveA
        previousMoveB = moveB
        
        currentTurnNum += 1
        
        return turnResult
    }
}
