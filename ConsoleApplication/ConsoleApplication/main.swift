//
//  main.swift
//  ConsoleApplication
//
//  Created by Augustin Giraudier on 17/01/2023.
//

import Foundation
import Puissance4

/// CREATE GRID & RULES

let nbCol = 7
let nbRows = 6

var rule = ClassicRules(nbRows: nbRows, nbCols: nbCol, nbPiecesToAlign: 4,nbPlayer: 2)
var oGrid = Grid(nbRows: nbRows,nbCol: nbCol)

guard let grid = oGrid else {
    print("Erreur de creation de la grille...")
    exit(1)
}


/// CREATE PLAYERS

// creation du joueur 1
let oPlayer1 = HumanPlayer(withid: 0, andName: "J1", displayedAs: "X", displayFunc: displayMsg, inputIntFunc: consoleNextInt)

// ajout
guard let player1 = oPlayer1 else {
    print("Error : creation of the first Player")
    exit(1)
}

// creation du joueur 2
var input : Int? = nil
var oPlayer2 : Player?
while input == nil {
    print("What type of second player do you want ?")
    print(" 1 - play with a friend")
    print(" 2 - play against a robot")
    input = consoleNextInt()
    guard input != nil else {continue}
    switch(input!){
    case 1:
        oPlayer2 = HumanPlayer(withid: 1, andName: "J2", displayedAs: "O", displayFunc: displayMsg, inputIntFunc: consoleNextInt)
    case 2:
        oPlayer2 = RobotPlayer(withid: 1, andName: "J2", displayedAs: "O", displayFunc: displayMsg, inputIntFunc: consoleNextInt)
    default:
        input = nil
        break
    }
    if oPlayer2 == nil {
        input = nil
    }
}

guard let player2 = oPlayer2 else {
    print("Error : creation of the second Player")
    exit(1)
}

/// CREATE GAME

var oGame = Game(withgrid: grid, andRules: rule, andGridDisplayFunc: consoleDisplaygrid, displayFunc: displayMsg,players: [player1, player2])

guard var game = oGame else{
    print("Erreur de creation de la partie...")
    exit(1)
}

/// Lancement de la partie

game.play()

print("--- Game is finished ---")
