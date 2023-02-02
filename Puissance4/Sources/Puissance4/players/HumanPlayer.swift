//
//  HumanPlayer.swift
//  
//
//  Created by Augustin Giraudier on 01/02/2023.
//

import Foundation


public class HumanPlayer : Player{
    
    public override init?(withid id: Int, andName name: String, displayedAs symbol: String? = nil, displayFunc: @escaping (String) -> Void, inputIntFunc: @escaping () -> Int?) {
        super.init(withid: id, andName: name, displayedAs: symbol, displayFunc: displayFunc, inputIntFunc: inputIntFunc)
    }
    
    public override func chooseColumn(withGrid grid : Grid, andRules rules : Rules) -> Int? {
        display("Choose a column Number : ")
        return getIntInput()
    }
    
    
}
