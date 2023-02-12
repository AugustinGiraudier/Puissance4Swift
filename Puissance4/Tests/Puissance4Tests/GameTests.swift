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
            let game = Game(withgrid: grid, andRules: rules, andGridDisplayFunc: UtDisplayGrid, displayFunc: UtDisplay, players: [HumanPlayer(withid: 0, andName: "name", displayFunc: UtDisplay, inputIntFunc: UtGetInt)!])
            if shouldWork{
                XCTAssertNotNil(game)
            }
            else{
                XCTAssertNil(game)
            }
        }
        
        var grid = Grid(nbRows: 3, nbCol: 3)
        var rules = ClassicRules(nbRows: 3, nbCols: 3, nbPiecesToAlign: 5, nbPlayer: 1)
        expect(grid: grid!, rules: rules, shouldWork: true)
        
        rules = ClassicRules(nbRows: 3, nbCols: 3, nbPiecesToAlign: 5, nbPlayer: 0)
        expect(grid: grid!, rules: rules, shouldWork: false)
        
        grid = Grid(nbRows: 3, nbCol: 3)
        rules = ClassicRules(nbRows: 2, nbCols: 2, nbPiecesToAlign: 5, nbPlayer: 1)
        expect(grid: grid!, rules: rules, shouldWork: false)
        
        grid = Grid(nbRows: 3, nbCol: 3)
        rules = ClassicRules(nbRows: 3, nbCols: 2, nbPiecesToAlign: 5, nbPlayer: 1)
        expect(grid: grid!, rules: rules, shouldWork: false)
        
        grid = Grid(nbRows: 3, nbCol: 3)
        rules = ClassicRules(nbRows: 2, nbCols: 3, nbPiecesToAlign: 5, nbPlayer: 1)
        expect(grid: grid!, rules: rules, shouldWork: false)
        
    
    }
    
    func testAddingManyPlayersWithSameId(){
        
        let grid = Grid(nbRows: 3, nbCol: 3)!
        let rules = ClassicRules(nbRows: 3, nbCols: 3, nbPiecesToAlign: 5, nbPlayer: 2)
        
        let players = [
            HumanPlayer(withid: 0, andName: "A", displayFunc: UtDisplay, inputIntFunc: UtGetInt)!,
            HumanPlayer(withid: 0, andName: "B", displayFunc: UtDisplay, inputIntFunc: UtGetInt)!
        ]
        
        let game = Game(withgrid: grid, andRules: rules, andGridDisplayFunc: UtDisplayGrid, displayFunc: UtDisplay, players: players)
        
        XCTAssertNil(game)
    }
    
    func testWinningPlay(){
        
        // test qu'une partie se passe bien en remplissant la grille dans la colonne 0
        
        let grid = Grid(nbRows: 2,nbCol: 2)!
        let rules = ClassicRules(nbRows: 2, nbCols: 2, nbPiecesToAlign: 1, nbPlayer: 1)
        
        var g = Game(withgrid: grid, andRules: rules, andGridDisplayFunc: UtDisplayGrid, displayFunc: UtDisplay, players: [
            HumanPlayer(withid: 0, andName: "name", displayFunc: UtDisplay, inputIntFunc: UtGetInt)!
        ])
        
        g!.play()
        
        XCTAssertEqual(0, g?.grid[0,1])
        XCTAssertNil(g?.grid[0,0])
        XCTAssertNil(g?.grid[1,1])
        XCTAssertNil(g?.grid[1,0])
        
    }
    
    func testNotWinningPlay(){
        
        // petit test qu'une partie se passe bien en remplissant la grille dans la colonne 1
        func getResponse() -> Int? {
            struct Holder {
                static let values = [nil, 0,0,1,1]
                static var index = -1
            }
            Holder.index+=1
            return Holder.values[Holder.index]
        }
        // cette fonction retourne : nil 0 0 1 1 (pour remplir la grille par les deux joueurs)
        // donc on test de remplir la grille 2x2 pour verifier que la partie se termine meme sans gagnant
        
        let grid = Grid(nbRows: 2,nbCol: 2)!
        let rules = ClassicRules(nbRows: 2, nbCols: 2, nbPiecesToAlign: 3, nbPlayer: 2)
        
        var g = Game(withgrid: grid, andRules: rules, andGridDisplayFunc: UtDisplayGrid, displayFunc: UtDisplay, players: [
            HumanPlayer(withid: 0, andName: "name", displayFunc: UtDisplay, inputIntFunc: getResponse)!,
            HumanPlayer(withid: 1, andName: "name2", displayFunc: UtDisplay, inputIntFunc: getResponse)!
        ])
        
        g!.play()
        
        XCTAssertNotNil(g?.grid[1,1])
        XCTAssertNotNil(g?.grid[0,0])
        XCTAssertNotNil(g?.grid[0,1])
        XCTAssertNotNil(g?.grid[1,0])
        
    }
    
    func testRobotPlayer(){
        
        let grid = Grid(nbRows: 2,nbCol: 2)!
        let rules = ClassicRules(nbRows: 2, nbCols: 2, nbPiecesToAlign: 3, nbPlayer: 1)
        let player = RobotPlayer(withid: 0, andName: "hh", displayFunc: UtDisplay, inputIntFunc: UtGetInt, sleepingTime: 0)!
        
        var game = Game(withgrid: grid, andRules: rules, andGridDisplayFunc: UtDisplayGrid, displayFunc: UtDisplay, players: [player])!
        
        game.play()
        
        XCTAssertTrue(game.grid.isFull())
        
    }

}
