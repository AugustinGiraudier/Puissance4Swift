//
//  GameTests.swift
//  
//
//  Created by etudiant on 01/02/2023.
//

import Foundation
import XCTest
@testable import Puissance4

final class GameTests: XCTestCase {

    func testGame(){
        
        func expect(grid: Grid, rules : Rules, shouldWork : Bool){
            var game = Game(withgrid: grid, andRules: rules, andGridDisplayFunc: consoleDisplaygrid, displayFunc: displayMsg, inputIntFunc: consoleNextInt, inputStrFunc: consoleNextString)
            if shouldWork{
                XCTAssertNotNil(game)
            }
            else{
                XCTAssertNil(game)
            }
        }
        
        var grid = Grid(nbRows: 3, nbCol: 3)
        var rules = ClassicRules(nbRows: 3, nbCols: 3, nbPiecesToAlign: 5)
        expect(grid: grid!, rules: rules, shouldWork: true)
        
        grid = Grid(nbRows: 3, nbCol: 3)
        rules = ClassicRules(nbRows: 2, nbCols: 2, nbPiecesToAlign: 5)
        expect(grid: grid!, rules: rules, shouldWork: false)
        
        grid = Grid(nbRows: 3, nbCol: 3)
        rules = ClassicRules(nbRows: 3, nbCols: 2, nbPiecesToAlign: 5)
        expect(grid: grid!, rules: rules, shouldWork: false)
        
        grid = Grid(nbRows: 3, nbCol: 3)
        rules = ClassicRules(nbRows: 2, nbCols: 3, nbPiecesToAlign: 5)
        expect(grid: grid!, rules: rules, shouldWork: false)
    
    }

}
