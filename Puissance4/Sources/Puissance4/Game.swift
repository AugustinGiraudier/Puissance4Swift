//
//  Game.swift
//  
//
//  Created by Augustin Giraudier on 17/01/2023.
//

import Foundation


public struct Game{
    
    
    private var gride : Gride
    private let displayer : Displayer
    
    public init(gride: Gride, displayer : Displayer? = nil) {
        self.gride = gride
        if displayer == nil{
            self.displayer = ConsoleDisplayer()
        }
        else{
            self.displayer = displayer!
        }
    }
    
    public func displayGride(){
        displayer.displayGride(gride: gride)
    }
    
}
