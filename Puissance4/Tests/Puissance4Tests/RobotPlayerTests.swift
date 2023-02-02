//
//  RobotPlayerTests.swift
//  
//
//  Created by Augustin Giraudier on 02/02/2023.
//

import Foundation
import XCTest
@testable import Puissance4

final class RobotPlayerTests: XCTestCase {

    func testRobotOnFullGrid(){
        
        var grid = Grid(nbRows: 2,nbCol: 2)!
        let rules = ClassicRules(nbRows: 2, nbCols: 2, nbPiecesToAlign: 3, nbPlayer: 1)
        let player = RobotPlayer(withid: 0, andName: "hh", displayFunc: UtDisplay, inputIntFunc: UtGetInt, sleepingTime: 0)!
        
        _=grid.addPiece(col: 0, id: 0)
        _=grid.addPiece(col: 0, id: 0)
        _=grid.addPiece(col: 1, id: 0)
        _=grid.addPiece(col: 1, id: 0)
        
        XCTAssertTrue(grid.isFull())
        XCTAssertNil(player.chooseColumn(withGrid: grid, andRules: rules))
        
    }
    
    func testRobotDefaultConstructor(){
        
        let player = RobotPlayer(withid: 0, andName: "hh", displayFunc: UtDisplay, inputIntFunc: UtGetInt)
        
        XCTAssertNotNil(player)
        XCTAssertNotNil(player!.sleepingTime)

    }

}
