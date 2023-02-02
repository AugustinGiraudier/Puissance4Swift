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
    
    func testWinningPlay(){
        
        // petit test qu'une partie se passe bien en remplissant la grille dans la colonne 1
        
        func doNothing(_ msg : String){return}
        func getOne() -> Int {return 1}
        func getStr() -> String {return ""}
        func doNothingWithGrid(grid: Grid,dict: Dictionary<Int?, String?>?){return}
        
        let grid = Grid(nbRows: 2,nbCol: 2)!
        let rules = ClassicRules(nbRows: 2, nbCols: 2, nbPiecesToAlign: 1)
        
        var g = Game(withgrid: grid, andRules: rules, andGridDisplayFunc: doNothingWithGrid, displayFunc: doNothing, inputIntFunc: getOne, inputStrFunc: getStr)
        
        let res = g!.play()
        
        XCTAssertEqual(EndGame.GAME_ENDED, res)
        XCTAssertEqual(0, g?.grid[1,1])
        XCTAssertNil(g?.grid[0,0])
        XCTAssertNil(g?.grid[0,1])
        XCTAssertNil(g?.grid[1,0])
        
    }
    
    func testNotWinningPlay(){
        
        // petit test qu'une partie se passe bien en remplissant la grille dans la colonne 1
        
        func doNothing(_ msg : String){return}
        func getStr() -> String {return ""}
        func doNothingWithGrid(grid: Grid,dict: Dictionary<Int?, String?>?){return}
        func getResponse() -> Int? {
            struct Holder {
                static var isFirstCall = true
                static var isSecondCall = true
                static var timesCalled = -1
                static var val = 0
            }
            
            if Holder.isFirstCall {
                Holder.isFirstCall = false
                return 1
            }
            if(Holder.isSecondCall){
                Holder.isSecondCall = false
                return nil
            }
            
            Holder.timesCalled += 1
            if Holder.timesCalled >= 2{
                Holder.timesCalled = 0
                Holder.val += 1
            }
            
            
            return Holder.val
        }
        // cette fonction retourne : 1 nil 0 0 1 1 2 2 3 3 4 4 ...
        // donc on choisi de jouer a 2 joueurs puis on test un retour nil et on remplis la grille 2x2
        
        let grid = Grid(nbRows: 2,nbCol: 2)!
        let rules = ClassicRules(nbRows: 2, nbCols: 2, nbPiecesToAlign: 3)
        
        var g = Game(withgrid: grid, andRules: rules, andGridDisplayFunc: doNothingWithGrid, displayFunc: doNothing, inputIntFunc: getResponse, inputStrFunc: getStr)
        
        let res = g!.play()
        
        XCTAssertEqual(EndGame.GAME_ENDED, res)
        XCTAssertNotNil(g?.grid[1,1])
        XCTAssertNotNil(g?.grid[0,0])
        XCTAssertNotNil(g?.grid[0,1])
        XCTAssertNotNil(g?.grid[1,0])
        
    }

}
