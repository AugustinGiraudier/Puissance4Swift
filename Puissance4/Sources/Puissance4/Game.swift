//
//  Game.swift
//  
//
//  Created by Augustin Giraudier on 17/01/2023.
//

import Foundation


public struct Game{
    
    
    private var gride : Gride
    
    public init(gride: Gride) {
        self.gride = gride
    }
    
    public func displayGride(){
        print(gride)
    }
    
}
