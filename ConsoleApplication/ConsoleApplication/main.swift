//
//  main.swift
//  ConsoleApplication
//
//  Created by Augustin Giraudier on 17/01/2023.
//

import Foundation
import Puissance4

var h = HumanPlayer(withid: 0, andName: "J1", displayFunc: displayMsg, inputIntFunc: consoleNextInt, inputStrFunc: consoleNextString)


var rule = ClassicRules(nbRows: 7, nbCols: 6, nbPiecesToAlign: 4)

var gridW : Grid? = Grid()
guard var grid = gridW else{
    print("Error : grid = null")
    exit(1)
}

print(h?.chooseColumn(withGrid: grid, andRules: rule))

exit(0)

_=grid.addPiece(col: 0, id: 0)

_=grid.addPiece(col: 1, id: 1)
_=grid.addPiece(col: 1, id: 0)

_=grid.addPiece(col: 2, id: 1)
_=grid.addPiece(col: 2, id: 1)

_=grid.addPiece(col: 3, id: 1)
_=grid.addPiece(col: 3, id: 1)
_=grid.addPiece(col: 3, id: 1)
_=grid.addPiece(col: 3, id: 0)

print(rule.checkWinner(grid: grid, lastInserted: (3,2)))


//var game : Game = Game(withgrid: grid, andDisplayer: ConsoleDisplayer())

//var disp = ConsoleDisplayer()
//disp.displaygrid(grid, withSymbolMapper: [0:"X", 1:"O"])
