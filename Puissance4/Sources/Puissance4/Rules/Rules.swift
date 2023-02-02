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

    ///
    /// Verifie si le nombre de joueur respecte les regles
    /// - Parameter nbPalayer:nombre de joueurs à tester
    /// - Returns:true si le nombre est conforme aux regles
    func nbPlayerRespectsRules(_ nbPalayer : Int) -> Bool

    ///
    /// Verifie si la grille respecte les regles
    /// - Parameter grid:grille a tester
    /// - Returns:true si la grille respecte les regles, sinon false
    func gridRespectsRules(_ grid: Grid) -> Bool

    ///
    /// Verifie si la grille comporte une disposition gagnante dans la grille
    /// - Parameters:
    ///   - grid: grille à observer
    ///   - lastInserted: coordonnées (colonne, ligne) de la derniere insertion de piece
    /// - Returns:true si la derniere insertion a permis de gagner
    func checkWinner(grid: Grid, lastInserted: (Int, Int)) -> Bool
}
