//
//  Grid.swift
//  
//
//  Created by Augustin Giraudier on 17/01/2023.
//

import Foundation


public struct Grid{
    
    // ---- datas ---- //
    
    private var grid : [[Int?]]
    public let nbRows : Int
    public let nbCol : Int
    
    // ---- init ---- //
    
    public init?(nbRows: Int = 6, nbCol: Int = 7) {
        guard nbRows > 0 && nbCol > 0 else{
            return nil
        }
        self.nbRows = nbRows
        self.nbCol = nbCol
        self.grid = Array(repeating: Array(repeating: nil, count: nbCol), count: nbRows)
    }
    
    // ---- public methodes ---- //

    ///
    /// Retourne l'id du joueur possédant la case ou nil si vide
    /// - Parameters:
    ///   - col: colonne
    ///   - row: ligne
    /// - Returns:l'id du joueur
    public subscript(col: Int, row : Int) -> Int? {
        get {
            if col > nbCol-1 || col < 0 || row > nbRows-1 || row < 0{
                return nil
            }
            return grid[row][col]
        }
    }

    ///
    /// Ajoute une piece à la colonne donnée avec l'id passé en paramètre
    /// - Parameters:
    ///   - col: colonne où ajouter une piece
    ///   - id: id du possésseur de la piece
    /// - Returns:true si la piece a pu etre ajouter sinon false
    public mutating func addPiece(col : Int, id: Int) -> (Bool, Int, Int){
        if col > nbCol-1 || col < 0{
            return (false, 0, 0)
        }
        var iRow : Int = nbRows-1
        var placing = (false, 0, 0)
        while !placing.0 && iRow >= 0{
            placing = addPiece(col: col, row: iRow, id: id)
            iRow-=1
        }
        return  placing
    }

    ///
    /// Permet de savoir si la grille est pleine
    /// - Returns:true s'il n'y a plus d'emplacement vide dans la grille
    public func isFull() -> Bool{
        for iRow in grid{
            for iCol : Int? in iRow{
                if iCol == nil{
                    return false
                }
            }
        }
        return true
    }
    
    // ---- private methodes ---- //

    ///
    /// Ajoute une piece à la ligne et la colonne spécifiées
    /// - Parameters:
    ///   - col: colonne ou ajouter la piece
    ///   - row: ligne ou ajouter la piece
    ///   - id: id du possesseur de la piece
    /// - Returns:true si la piece a pu etre ajoutee
    private mutating func addPiece(col : Int, row : Int, id : Int) -> (Bool, Int, Int){
        if col > nbCol-1 || col < 0 || row > nbRows-1 || row < 0 || grid[row][col] != nil{
            return (false, 0, 0)
        }
		self.grid[row][col] = id
        return (true, col, row)
    }
}
