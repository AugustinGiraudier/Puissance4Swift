//
//  RobotPlayer.swift
//  
//
//  Created by etudiant on 01/02/2023.
//

import Foundation


public class RobotPlayer : Player{
    
    public override init?(withid id: Int, andName name: String, displayedAs symbol: String? = nil, displayFunc: @escaping (String) -> Void, inputIntFunc: @escaping () -> Int?) {
        super.init(withid: id, andName: name, displayedAs: symbol, displayFunc: displayFunc, inputIntFunc: inputIntFunc)
    }
    
    public override func chooseColumn(withGrid grid : Grid, andRules rules : Rules) -> Int? {
        display("Robot is thinking...")
        var g = grid
        sleep(2)
        for i in (0..<g.nbCol).shuffled() {
            if g.addPiece(col: i, id: 0).0 {
                return i
            }
        }
        return getIntInput()
    }
    
    
}
