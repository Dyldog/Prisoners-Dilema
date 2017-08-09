//
//  ViewController.swift
//  PrisonersDilemma
//
//  Created by Dylan Elliott on 8/1/17.
//  Copyright © 2017 Dylan Elliott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var prisonerGame : PrisonerGame?
    
    let strategyTypes : [PrisonerStrategy.Type] = [GoodGuyStrategy.self, BadGuyStrategy.self, CopycatStrategy.self, BadCopyCatStrategy.self, OppositeCatStrategy.self]
    
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var strategyTypeASelector: UISegmentedControl!
    @IBOutlet weak var strategyTypeBSelector: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for selector : UISegmentedControl in [strategyTypeASelector, strategyTypeBSelector] {
            selector.removeAllSegments()
            for strategyType in strategyTypes {
                selector.insertSegment(withTitle: strategyType.displayName(), at: selector.numberOfSegments, animated: false)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func runGame(numMoves : Int) -> String {
        var outputLines = [String]()
        
        if let prisonerGame = self.prisonerGame {
            var totalScore = (0,0)
            
            for _ in 0..<10 {
                let turnResult = prisonerGame.nextTurn()
                totalScore.0 += turnResult.0
                totalScore.1 += turnResult.1
                
                outputLines.append("\(prisonerGame.currentTurnNum): \(prisonerGame.previousMoveA?.rawValue ?? "n/a") (\(turnResult.0)) \(prisonerGame.previousMoveB?.rawValue ?? "n/a") (\(turnResult.1))")
            }
            
            outputLines.append("TOTAL: \(totalScore.0) \(totalScore.1)")
        }
        
        return outputLines.joined(separator: "\n")
    }
    
    @IBAction func goButtonTapped(_ sender: UIButton) {
        self.prisonerGame = PrisonerGame(firstStrategy:strategyTypes[strategyTypeASelector.selectedSegmentIndex].init(), secondStrategy: strategyTypes[strategyTypeBSelector.selectedSegmentIndex].init())
        let gameResult = runGame(numMoves: 10)
        
        self.outputTextView.text = gameResult
    }
    
}

