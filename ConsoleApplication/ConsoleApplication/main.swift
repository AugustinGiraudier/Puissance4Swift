//
//  main.swift
//  ConsoleApplication
//
//  Created by Augustin Giraudier on 17/01/2023.
//

import Foundation
import Puissance4

var rule = ClassicRules(nbRows: 7, nbCols: 6, nbPiecesToAlign: 4)

var grideW : Grid? = Grid()
guard var gride = grideW else{
    print("Error : gride = null")
    exit(1)
}

_=gride.addPiece(col: 0, id: 0)

_=gride.addPiece(col: 1, id: 1)
_=gride.addPiece(col: 1, id: 0)

_=gride.addPiece(col: 2, id: 1)
_=gride.addPiece(col: 2, id: 1)

_=gride.addPiece(col: 3, id: 1)
_=gride.addPiece(col: 3, id: 1)
_=gride.addPiece(col: 3, id: 1)
_=gride.addPiece(col: 3, id: 0)

print(rule.checkWinner(gride: gride, lastInserted: (3,2)))


//var game : Game = Game(withGride: gride, andDisplayer: ConsoleDisplayer())

var disp = ConsoleDisplayer()
disp.displayGride(gride, withSymbolMapper: [0:"X", 1:"O"])
