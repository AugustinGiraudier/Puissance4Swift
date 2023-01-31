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

    public init(nbRows : Int, nbCols : Int, nbPiecesToAlign : Int){
        self.nbCols = nbCols
        self.nbRows = nbRows
        self.nbPiecesToAlign = nbPiecesToAlign
    }

    public func checkWinner(gride: Gride, lastInserted: (Int, Int)) -> Bool {
        
        // errors :
        if lastInserted.0 < 0 || lastInserted.0 >= gride.nbCol || lastInserted.1 < 0 || lastInserted.1 >= gride.nbRows{
            return false
        }
        
        // verify last inserted place not nil
        guard let playerId = gride[lastInserted.0, lastInserted.1] else{
            return false
        }


        let steps = [
            // toApplyOnX | toApplyOnY | restetNbPice?

            (1, 0, true),       // horizontal droite
            (-1, 0, false),     // horizontal gauche
            (0, 1, true),       // vertical bas
            (1, 1, true),       // diagonal droite haut
            (-1, -1, false),    // diagonal gauche bass
            (1, -1, true),      // diagonal droite bas
            (-1, 1, false)      // diagonal gauche haut
        ]

        var nbPieceAligned : Int = 1;
        var x : Int
        var y : Int

        for step in steps {
            if step.2{
                nbPieceAligned = 1
            }

            x = lastInserted.0 + step.0;
            y = lastInserted.1 + step.1;

            var test = gride[x,y]

            while let id = gride[x,y], id == playerId {
                x += step.0
                y += step.1
                nbPieceAligned+=1
                if nbPieceAligned >= nbPiecesToAlign {
                    return true
                }
            }
        }
        return false
    }
    
    
    
    
    
}
