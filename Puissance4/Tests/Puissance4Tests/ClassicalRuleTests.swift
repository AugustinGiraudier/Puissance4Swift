//
// Created by Augustin Giraudier on 31/01/2023.
//

import Foundation
import XCTest
@testable import Puissance4

final class ClassicalRuleTests : XCTestCase {

    func testGrideVerif(){

        func expect(rule: Rules, gride : Grid?, shouldWork : Bool){
            if shouldWork{
                XCTAssertTrue(rule.grideRespectsRules(gride!))
            }else{
                XCTAssertFalse(rule.grideRespectsRules(gride!))
            }
        }

        let rule = ClassicRules(nbRows: 6, nbCols: 5, nbPiecesToAlign: 9)

        expect(rule: rule, gride: Grid(nbRows: 6, nbCol: 5), shouldWork: true)
        expect(rule: rule, gride: Grid(nbRows: 1, nbCol: 1), shouldWork: false)
        expect(rule: rule, gride: Grid(nbRows: 5, nbCol: 6), shouldWork: false)

    }

    func testWinner(){

        func expect(rule : Rules, gride : Grid, lastInserted: (Int, Int), shouldWin : Bool){
            XCTAssertEqual(shouldWin, rule.checkWinner(gride: gride, lastInserted: lastInserted))
        }

        let rule = ClassicRules(nbRows: 6, nbCols: 7, nbPiecesToAlign: 4)
        var gride = Grid()!

        // test lastInserted nil :
        expect(rule: rule, gride: gride, lastInserted: (0,0), shouldWin: false)

        // test lastInserted out of bounds :
        expect(rule: rule, gride: gride, lastInserted: (100,100), shouldWin: false)

        // test vertical simple :
        _=gride.addPiece(col: 0, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (0,5), shouldWin: false)
        _=gride.addPiece(col: 0, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (0,4), shouldWin: false)
        _=gride.addPiece(col: 0, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (0,3), shouldWin: false)
        _=gride.addPiece(col: 0, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (0,2), shouldWin: true)

        // test vertical complet mais plusieurs id : doit fail
        _=gride.addPiece(col: 1, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (1,5), shouldWin: false)
        _=gride.addPiece(col: 1, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (1,4), shouldWin: false)
        _=gride.addPiece(col: 1, id: 1)
        expect(rule: rule, gride: gride, lastInserted: (1,3), shouldWin: false)
        _=gride.addPiece(col: 1, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (1,2), shouldWin: false)

        gride = Grid()!
        
        // test horizontal simple
        _=gride.addPiece(col: 0, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (0,5), shouldWin: false)
        _=gride.addPiece(col: 1, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (1,5), shouldWin: false)
        _=gride.addPiece(col: 2, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (2,5), shouldWin: false)
        _=gride.addPiece(col: 3, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (3,5), shouldWin: true)
        
        // test horizontal en ne gagnant pas par une extremite
        _=gride.addPiece(col: 0, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (0,4), shouldWin: false)
        _=gride.addPiece(col: 1, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (1,4), shouldWin: false)
        _=gride.addPiece(col: 3, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (3,4), shouldWin: false)
        _=gride.addPiece(col: 2, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (2,4), shouldWin: true)
        
        // test horizontal avec plusieurs id : doit fail
        _=gride.addPiece(col: 0, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (0,3), shouldWin: false)
        _=gride.addPiece(col: 1, id: 1)
        expect(rule: rule, gride: gride, lastInserted: (1,3), shouldWin: false)
        _=gride.addPiece(col: 3, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (3,3), shouldWin: false)
        _=gride.addPiece(col: 2, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (2,3), shouldWin: false)
        
        gride = Grid()!
        
        // test diagonale montante
        _=gride.addPiece(col: 0, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (0,5), shouldWin: false)
        _=gride.addPiece(col: 1, id: 1)
        _=gride.addPiece(col: 1, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (1,4), shouldWin: false)
        _=gride.addPiece(col: 2, id: 1)
        _=gride.addPiece(col: 2, id: 1)
        _=gride.addPiece(col: 2, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (2,3), shouldWin: false)
        _=gride.addPiece(col: 3, id: 1)
        _=gride.addPiece(col: 3, id: 1)
        _=gride.addPiece(col: 3, id: 1)
        _=gride.addPiece(col: 3, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (3,2), shouldWin: true)
        
        gride = Grid()!
        
        // test diagonale montante gagnee par le centre
        _=gride.addPiece(col: 0, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (0,5), shouldWin: false)
        _=gride.addPiece(col: 1, id: 1)
        _=gride.addPiece(col: 1, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (1,4), shouldWin: false)
        _=gride.addPiece(col: 2, id: 1)
        _=gride.addPiece(col: 2, id: 1)
        expect(rule: rule, gride: gride, lastInserted: (2,4), shouldWin: false)
        _=gride.addPiece(col: 3, id: 1)
        _=gride.addPiece(col: 3, id: 1)
        _=gride.addPiece(col: 3, id: 1)
        _=gride.addPiece(col: 3, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (3,2), shouldWin: false)
        _=gride.addPiece(col: 2, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (2,3), shouldWin: true)
        
        gride = Grid()!
        
        // test diagonale descendante
        _=gride.addPiece(col: 0, id: 1)
        _=gride.addPiece(col: 0, id: 1)
        _=gride.addPiece(col: 0, id: 1)
        _=gride.addPiece(col: 0, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (0,2), shouldWin: false)
        _=gride.addPiece(col: 1, id: 1)
        _=gride.addPiece(col: 1, id: 1)
        _=gride.addPiece(col: 1, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (1,3), shouldWin: false)
        _=gride.addPiece(col: 2, id: 1)
        _=gride.addPiece(col: 2, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (2,4), shouldWin: false)
        _=gride.addPiece(col: 3, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (3,5), shouldWin: true)
        
        gride = Grid()!
        
        // test diagonale descendante gagnee par le centre
        _=gride.addPiece(col: 0, id: 1)
        _=gride.addPiece(col: 0, id: 1)
        _=gride.addPiece(col: 0, id: 1)
        _=gride.addPiece(col: 0, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (0,2), shouldWin: false)
        _=gride.addPiece(col: 1, id: 1)
        _=gride.addPiece(col: 1, id: 1)
        expect(rule: rule, gride: gride, lastInserted: (1,3), shouldWin: false)
        _=gride.addPiece(col: 2, id: 1)
        _=gride.addPiece(col: 2, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (2,3), shouldWin: false)
        _=gride.addPiece(col: 3, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (3,5), shouldWin: false)
        _=gride.addPiece(col: 1, id: 0)
        expect(rule: rule, gride: gride, lastInserted: (1,3), shouldWin: true)
        
    }



}
