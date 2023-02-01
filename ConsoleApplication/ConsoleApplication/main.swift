//
//  main.swift
//  ConsoleApplication
//
//  Created by Augustin Giraudier on 17/01/2023.
//

import Foundation
import Puissance4

var rule = ClassicRules(nbRows: 6, nbCols: 7, nbPiecesToAlign: 4)
var oGrid = Grid()

guard let grid = oGrid else {
    print("Erreur de creation de la grille...")
    exit(1)
}

var oGame = Game(withgrid: grid, andRules: rule, andGridDisplayFunc: consoleDisplaygrid, displayFunc: displayMsg, inputIntFunc: consoleNextInt, inputStrFunc: consoleNextString)

guard var game = oGame else{
    print("Erreur de creation de la partie...")
    exit(1)
}

var res = game.play()

switch(res){
case .PLAYER_CANNOT_BE_CREATED:
    print("Error : player cannot be created")
case .GAME_ENDED:
    print("The game is ended...")
case .USER_QUIT:
    print("The User has quit")
}


