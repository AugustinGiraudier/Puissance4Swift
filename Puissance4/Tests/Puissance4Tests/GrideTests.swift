//
//  GrideTests.swift
//  
//
//  Created by Augustin Giraudier on 17/01/2023.
//

import Foundation
import XCTest
@testable import Puissance4

final class GrideTests: XCTestCase {
    
    func testCreateDefaultGride(){
        let gride = Gride()
        XCTAssertNotNil(gride, "Gride must be created")
        XCTAssertEqual(gride?.nbCol, 7, "Default cols number must be 7")
        XCTAssertEqual(gride?.nbRows, 6, "Default rows number must be 6")
    }
    
    func testCreateGrideWithValues(){
        let gride = Gride(nbRows: 4, nbCol: 5)
        XCTAssertNotNil(gride, "Gride 1 must be created")
        XCTAssertEqual(gride?.nbRows, 4, "nb rows must be 4")
        XCTAssertEqual(gride?.nbCol, 5, "nb cols must be 5")
        
        // 0 val
        let gride2 = Gride(nbRows: 0, nbCol: 1)
        XCTAssertNil(gride2, "Gride 2 must be nil when nb rows = 0")
        
        // 0 val
        let gride3 = Gride(nbRows: 1, nbCol: 0)
        XCTAssertNil(gride3, "Gride 3 must be nil when nb cols = 0")
        
        // negative val
        let gride4 = Gride(nbRows: 1, nbCol: -5)
        XCTAssertNil(gride4, "Gride 4 must be nil when nb cols is negative")
        
        // negative val
        let gride5 = Gride(nbRows: -5, nbCol: 1)
        XCTAssertNil(gride5, "Gride 5 must be nil when nb rows is negative")
    }
    
    func testAddPiece(){
        var gride = Gride(nbRows: 2, nbCol: 2)
        
        // valid adding
        let res = gride?.addPiece(col: 0, id: 9)
        XCTAssertNotNil(res, "res shouldn't be nil")
        XCTAssertTrue(res!, "Piece adding must be succeeded")
        _ = gride?.addPiece(col: 0, id: 9)
        
        // col full
        let res2 = gride?.addPiece(col: 0, id: 9)
        XCTAssertNotNil(res2, "res 2 shouldn't be nil")
        XCTAssertFalse(res2!, "Piece 2 should be failed")
        
        // negative
        let res3 = gride?.addPiece(col: -1, id: 9)
        XCTAssertNotNil(res3, "res 3 shouldn't be nil")
        XCTAssertFalse(res3!, "Piece 3 should be failed")
        
        // out of bound
        let res4 = gride?.addPiece(col: 2, id: 9)
        XCTAssertNotNil(res4, "res 4 shouldn't be nil")
        XCTAssertFalse(res4!, "Piece 4 should be failed")
    }
    
    func testSubstract(){
        var gride = Gride(nbRows: 2, nbCol: 2)
        XCTAssertNotNil(gride)
        
        _=gride?.addPiece(col: 0, id: 9)
        XCTAssertEqual(gride![0,1],9)
        
        _=gride?.addPiece(col: 0, id: 9)
        XCTAssertEqual(gride![0,0],9)
        
        // empty place
        XCTAssertNil(gride![1,1])
        
        // out of bounds
        XCTAssertNil(gride![9,9])
    }
    
    func testFullGride(){
        var gride = Gride(nbRows: 2, nbCol: 2)
        XCTAssertNotNil(gride)
        
        XCTAssertFalse(gride!.isFull())
        
        _=gride?.addPiece(col: 0, id: 9)
        XCTAssertFalse(gride!.isFull())
        
        _=gride?.addPiece(col: 0, id: 9)
        XCTAssertFalse(gride!.isFull())
        
        _=gride?.addPiece(col: 1, id: 9)
        XCTAssertFalse(gride!.isFull())
        
        // full
        _=gride?.addPiece(col: 1, id: 9)
        XCTAssertTrue(gride!.isFull())
    }
    
}
