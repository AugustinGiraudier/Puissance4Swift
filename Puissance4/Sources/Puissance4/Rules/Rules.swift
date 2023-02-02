//
//
//  Rules.swift
//  
//
//  Created by Augustin Giraudier on 25/01/2023.
//

import Foundation

public protocol Rules{
    
    var nbPiecesToAlign : Int { get }
    var nbRows : Int { get }
    var nbCols : Int { get }
    var nbPlayers : Int { get }

    func nbPlayerRespectsRules(_ nbPalayer : Int) -> Bool
    func gridRespectsRules(_ grid: Grid) -> Bool
    func checkWinner(grid: Grid, lastInserted: (Int, Int)) -> Bool
}
