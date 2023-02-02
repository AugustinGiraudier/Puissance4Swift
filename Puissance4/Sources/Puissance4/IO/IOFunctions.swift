//
//  IOFunctions.swift
//  
//
//  Created by Augustin Giraudier on 01/02/2023.
//

import Foundation

///
/// Affiche une grille dans la console
/// - Parameters:
///   - grid: grille à afficher
///   - mapper: possibilité de donner un remplacement de l'id par un caractère sous forme de dictionnaire
public func consoleDisplaygrid(_ grid: Grid, withSymbolMapper mapper: Dictionary<Int?, String?>? = nil)
{
    // affichage des index :
    for i in 0..<grid.nbCol {
        print(" \(i)", terminator: "")
    }
    print("")
    // affichage de la grille
    for iRow in 0...grid.nbRows-1{
        for iCol in 0...grid.nbCol-1{
            var char = " "
            if let map = mapper, let symbol = map[grid[iCol, iRow]], let s=symbol{
                char = s
            }
            else if let id = grid[iCol, iRow]{
                char = String(id)
            }
            print("|\(char)", terminator: "")
        }
        print("|")
    }
}

///
/// Recupere l'entier entré par l'utilisateur dans la console ou nil
/// - Returns:l'entier entré par l'utilisateur dans la console ou nil
public func consoleNextInt() -> Int? {
    let str = readLine() ?? ""
    return Int(str)
}

///
/// Affiche les message dans la console
/// - Parameter msg:message à afficher
public func displayMsg(msg : String){
    print(msg)
}
