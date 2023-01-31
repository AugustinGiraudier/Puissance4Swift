//
//  ClassicRules.swift
//  
//
//  Created by Augustin Giraudier on 25/01/2023.
//

import Foundation

public struct ClassicRules : Rules{
    public var nbPiecesToAlign: Int
    
    public var nbRows: Int
    
    public var nbCols: Int
    
    public func checkWinner(gride: Gride, lastInserted: (Int, Int)) -> Bool {
        
        // errors :
        if lastInserted.0 < 0 || lastInserted.0 >= gride.nbCol || lastInserted.1 < 0 || lastInserted.1 >= gride.nbRows{
            return false
        }
        
        // verify last inserted place not nil
        guard let playerId = gride[lastInserted.0, lastInserted.1] else{
            return false
        }
        
        var x : Int = lastInserted.0
        var y : Int = lastInserted.1
        var totalAlign = 0
        
        // --- check line --- //
        while x > 0 && gride[x,y] == playerId{
            totalAlign+=1
            x -= 1
        }
        x = lastInserted.0
        while x < gride.nbCol && gride[x,y] == playerId{
            totalAlign += 1
            x+=1
        }
        if(totalAlign >= nbPiecesToAlign){
            return true // gagnant en ligne
        }
        
        x = lastInserted.0
        totalAlign = 0
        
        // --- check col --- //
        while y > 0 && gride[x,y] == playerId{
            totalAlign+=1
            y -= 1
        }
        y = lastInserted.0
        while y < gride.nbCol && gride[x,y] == playerId{
            totalAlign += 1
            y+=1
        }
        if(totalAlign >= nbPiecesToAlign){
            return true // gagnant en colonne
        }
        
        x = lastInserted.0
        totalAlign = 0
        
        // --- check first diago --- //
        
        return true
    }
    
    
    
    
    
}
