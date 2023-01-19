//
//  main.swift
//  ConsoleApplication
//
//  Created by Augustin Giraudier on 17/01/2023.
//

import Foundation
import Puissance4

var grideW : Gride? = Gride()
guard var gride = grideW else{
    print("Error : gride = null")
    exit(1)
}

_=gride.addPiece(col: 0, id: 0)
_=gride.addPiece(col: 0, id: 1)
_=gride.addPiece(col: 1, id: 0)
_=gride.addPiece(col: 2, id: 1)
_=gride.addPiece(col: 2, id: 0)
_=gride.addPiece(col: 2, id: 1)
_=gride.addPiece(col: 2, id: 0)

var game : Game = Game(withGride: gride, andDisplayer: ConsoleDisplayer())

var disp = ConsoleDisplayer()
disp.displayGride(gride, withSymbolMapper: [0:"X", 1:"O"])
