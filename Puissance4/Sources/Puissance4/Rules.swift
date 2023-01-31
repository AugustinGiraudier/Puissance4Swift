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

    func grideRespectsRules(_ gride: Gride) -> Bool
    func checkWinner(gride: Gride, lastInserted: (Int, Int)) -> Bool
    
}
