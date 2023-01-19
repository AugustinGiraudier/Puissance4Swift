//
//  Player.swift
//  
//
//  Created by Augustin Giraudier on 19/01/2023.
//

import Foundation
public class Player{
    
    public let id : Int
    public let name : String
    public let symbol : String
    
    public init?(withid id: Int, andName name: String, displayedAs symbol: String? = nil) {
        // verif id dans [0,9]
        guard id >= 0 && id<10 && name.count>0 else{
            return nil
        }
        
        self.id = id
        self.name = name
        
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
    
}
