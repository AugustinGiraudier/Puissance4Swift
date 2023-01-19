//
//  Game.swift
//  
//
//  Created by Augustin Giraudier on 17/01/2023.
//

import Foundation


public struct Game{
    
    private var gride : Gride
    private var players : [Player]
    
    public init(gride: Gride) {
        self.gride = gride
        players = Array()
    }
    
    public func displayGride(){
        print(gride)
    }
    
}
