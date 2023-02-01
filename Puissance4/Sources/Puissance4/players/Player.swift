//
//  Player.swift
//  
//
//  Created by Augustin Giraudier on 19/01/2023.
//

import Foundation
public class Player {
    
    internal let display : (String) -> Void
    internal let getIntInput : () -> Int?
    internal let getStrInput : () -> String
    
    public let id : Int
    public let name : String
    public let symbol : String
    
    public init?(withid id: Int, andName name: String,
                 displayedAs symbol: String? = nil,
                 displayFunc : @escaping (String)-> Void,
                 inputIntFunc : @escaping ()-> Int?,
                 inputStrFunc : @escaping ()-> String ){
        
        // verif id dans [0,9]
        guard id >= 0 && id<10 && name.count>0 else {
            return nil
        }
        
        self.id = id
        self.name = name
        self.display = displayFunc
        self.getIntInput = inputIntFunc
        self.getStrInput = inputStrFunc
        
        if let s = symbol{
            // verif symbol is one char
            guard s.count == 1 else{
                return nil
            }
            self.symbol = s
        }
        else{
            self.symbol = String(id)
        }
    }
    
    public func chooseColumn(withGrid grid : Grid, andRules rules : Rules) -> Int? {nil}
    
    
    
    
}
