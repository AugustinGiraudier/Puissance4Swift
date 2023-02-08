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
    public var nbPlayers : Int

    public init(nbRows : Int, nbCols : Int, nbPiecesToAlign : Int, nbPlayer : Int){
        self.nbCols = nbCols
        self.nbRows = nbRows
        self.nbPlayers = nbPlayer
        self.nbPiecesToAlign = nbPiecesToAlign
    }

    ///
    /// Verifie si la grille respecte les regles
    /// - Parameter grid:grille a tester
    /// - Returns:true si la grille respecte les regles, sinon false
    public func gridRespectsRules(_ grid: Grid) -> Bool {
        grid.nbRows == self.nbRows && grid.nbCol == self.nbCols
    }

    ///
    /// Verifie si la grille comporte une disposition gagnante dans la grille
    /// - Parameters:
    ///   - grid: grille à observer
    ///   - lastInserted: coordonnées (colonne, ligne) de la derniere insertion de piece
    /// - Returns:true si la derniere insertion a permis de gagner
    public func checkWinner(grid: Grid, lastInserted: (Int, Int)) -> Bool {
        
        // errors :
        if lastInserted.0 < 0 || lastInserted.0 >= grid.nbCol || lastInserted.1 < 0 || lastInserted.1 >= grid.nbRows{
            return false
        }
        
        // verify last inserted place not nil
        guard let playerId = grid[lastInserted.0, lastInserted.1] else{
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
            while let id = grid[x,y], id == playerId {
                x += step.0
                y += step.1
                nbPieceAligned+=1
            }
            if nbPieceAligned >= nbPiecesToAlign {
                return true
            }
        }
        return false
    }
    
    ///
    /// Verifie si le nombre de joueur respecte les regles
    /// - Parameter nbPalayer:nombre de joueurs à tester
    /// - Returns:true si le nombre est conforme aux regles
    public func nbPlayerRespectsRules(_ nbPalayer: Int) -> Bool {
        return self.nbPlayers == nbPalayer
    }
    
}
