//
//  PlayerTests.swift
//  
//
//  Created by Augustin Giraudier on 19/01/2023.
//

import XCTest
import Puissance4

final class PlayerTests: XCTestCase {


    func testInit(){
        func expect(id: Int,name: String,symbol: String? = nil, shouldNotBeNil: Bool = true){
            let p : Player? = Player(withid: id, andName: name, displayedAs: symbol)
            if shouldNotBeNil{
                XCTAssertNotNil(p)
            }
            else{
                XCTAssertNil(p)
            }
        }
        
        expect(id: -1, name: "tutu", symbol: "b", shouldNotBeNil: false)
        expect(id: 10, name: "tutu", symbol: "b", shouldNotBeNil: false)
        expect(id: 1, name: "tutu", symbol: "ba", shouldNotBeNil: false)
        expect(id: 1, name: "tutu", symbol: "", shouldNotBeNil: false)
        expect(id: 1, name: "", symbol: "b", shouldNotBeNil: false)
        
        expect(id: 1, name: "tutu", symbol: "b")
        expect(id: 9, name: "tutu", symbol: "X")
        expect(id: 0, name: "tutu", symbol: "-")
        expect(id: 0, name: "tutu")
        
    }

}
