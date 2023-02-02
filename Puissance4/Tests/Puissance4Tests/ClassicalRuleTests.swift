//
// Created by Augustin Giraudier on 31/01/2023.
//

import Foundation
import XCTest
@testable import Puissance4

final class ClassicalRuleTests : XCTestCase {

    func testgridVerif(){

        func expect(rule: Rules, grid : Grid?, shouldWork : Bool){
            if shouldWork{
                XCTAssertTrue(rule.gridRespectsRules(grid!))
            }else{
                XCTAssertFalse(rule.gridRespectsRules(grid!))
            }
        }

        let rule = ClassicRules(nbRows: 6, nbCols: 5, nbPiecesToAlign: 9, nbPlayer: 0)

        expect(rule: rule, grid: Grid(nbRows: 6, nbCol: 5), shouldWork: true)
        expect(rule: rule, grid: Grid(nbRows: 1, nbCol: 1), shouldWork: false)
        expect(rule: rule, grid: Grid(nbRows: 5, nbCol: 6), shouldWork: false)

    }

    func testWinner(){

        func expect(rule : Rules, grid : Grid, lastInserted: (Int, Int), shouldWin : Bool){
            XCTAssertEqual(shouldWin, rule.checkWinner(grid: grid, lastInserted: lastInserted))
        }

        let rule = ClassicRules(nbRows: 6, nbCols: 7, nbPiecesToAlign: 4, nbPlayer: 0)
        var grid = Grid()!

        // test lastInserted nil :
        expect(rule: rule, grid: grid, lastInserted: (0,0), shouldWin: false)

        // test lastInserted out of bounds :
        expect(rule: rule, grid: grid, lastInserted: (100,100), shouldWin: false)

        // test vertical simple :
        _=grid.addPiece(col: 0, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (0,5), shouldWin: false)
        _=grid.addPiece(col: 0, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (0,4), shouldWin: false)
        _=grid.addPiece(col: 0, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (0,3), shouldWin: false)
        _=grid.addPiece(col: 0, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (0,2), shouldWin: true)

        // test vertical complet mais plusieurs id : doit fail
        _=grid.addPiece(col: 1, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (1,5), shouldWin: false)
        _=grid.addPiece(col: 1, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (1,4), shouldWin: false)
        _=grid.addPiece(col: 1, id: 1)
        expect(rule: rule, grid: grid, lastInserted: (1,3), shouldWin: false)
        _=grid.addPiece(col: 1, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (1,2), shouldWin: false)

        grid = Grid()!
        
        // test horizontal simple
        _=grid.addPiece(col: 0, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (0,5), shouldWin: false)
        _=grid.addPiece(col: 1, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (1,5), shouldWin: false)
        _=grid.addPiece(col: 2, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (2,5), shouldWin: false)
        _=grid.addPiece(col: 3, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (3,5), shouldWin: true)
        
        // test horizontal en ne gagnant pas par une extremite
        _=grid.addPiece(col: 0, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (0,4), shouldWin: false)
        _=grid.addPiece(col: 1, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (1,4), shouldWin: false)
        _=grid.addPiece(col: 3, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (3,4), shouldWin: false)
        _=grid.addPiece(col: 2, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (2,4), shouldWin: true)
        
        // test horizontal avec plusieurs id : doit fail
        _=grid.addPiece(col: 0, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (0,3), shouldWin: false)
        _=grid.addPiece(col: 1, id: 1)
        expect(rule: rule, grid: grid, lastInserted: (1,3), shouldWin: false)
        _=grid.addPiece(col: 3, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (3,3), shouldWin: false)
        _=grid.addPiece(col: 2, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (2,3), shouldWin: false)
        
        grid = Grid()!
        
        // test diagonale montante
        _=grid.addPiece(col: 0, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (0,5), shouldWin: false)
        _=grid.addPiece(col: 1, id: 1)
        _=grid.addPiece(col: 1, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (1,4), shouldWin: false)
        _=grid.addPiece(col: 2, id: 1)
        _=grid.addPiece(col: 2, id: 1)
        _=grid.addPiece(col: 2, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (2,3), shouldWin: false)
        _=grid.addPiece(col: 3, id: 1)
        _=grid.addPiece(col: 3, id: 1)
        _=grid.addPiece(col: 3, id: 1)
        _=grid.addPiece(col: 3, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (3,2), shouldWin: true)
        
        grid = Grid()!
        
        // test diagonale montante gagnee par le centre
        _=grid.addPiece(col: 0, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (0,5), shouldWin: false)
        _=grid.addPiece(col: 1, id: 1)
        _=grid.addPiece(col: 1, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (1,4), shouldWin: false)
        _=grid.addPiece(col: 2, id: 1)
        _=grid.addPiece(col: 2, id: 1)
        expect(rule: rule, grid: grid, lastInserted: (2,4), shouldWin: false)
        _=grid.addPiece(col: 3, id: 1)
        _=grid.addPiece(col: 3, id: 1)
        _=grid.addPiece(col: 3, id: 1)
        _=grid.addPiece(col: 3, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (3,2), shouldWin: false)
        _=grid.addPiece(col: 2, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (2,3), shouldWin: true)
        
        grid = Grid()!
        
        // test diagonale descendante
        _=grid.addPiece(col: 0, id: 1)
        _=grid.addPiece(col: 0, id: 1)
        _=grid.addPiece(col: 0, id: 1)
        _=grid.addPiece(col: 0, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (0,2), shouldWin: false)
        _=grid.addPiece(col: 1, id: 1)
        _=grid.addPiece(col: 1, id: 1)
        _=grid.addPiece(col: 1, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (1,3), shouldWin: false)
        _=grid.addPiece(col: 2, id: 1)
        _=grid.addPiece(col: 2, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (2,4), shouldWin: false)
        _=grid.addPiece(col: 3, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (3,5), shouldWin: true)
        
        grid = Grid()!
        
        // test diagonale descendante gagnee par le centre
        _=grid.addPiece(col: 0, id: 1)
        _=grid.addPiece(col: 0, id: 1)
        _=grid.addPiece(col: 0, id: 1)
        _=grid.addPiece(col: 0, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (0,2), shouldWin: false)
        _=grid.addPiece(col: 1, id: 1)
        _=grid.addPiece(col: 1, id: 1)
        expect(rule: rule, grid: grid, lastInserted: (1,3), shouldWin: false)
        _=grid.addPiece(col: 2, id: 1)
        _=grid.addPiece(col: 2, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (2,3), shouldWin: false)
        _=grid.addPiece(col: 3, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (3,5), shouldWin: false)
        _=grid.addPiece(col: 1, id: 0)
        expect(rule: rule, grid: grid, lastInserted: (1,3), shouldWin: true)
        
    }



}
