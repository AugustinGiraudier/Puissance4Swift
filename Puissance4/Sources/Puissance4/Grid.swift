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
    
    public subscript(col: Int, row : Int) -> Int? {
        get {
            if col > nbCol-1 || col < 0 || row > nbRows-1 || row < 0{
                return nil
            }
            return grid[row][col]
        }
    }
    
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
    
    private mutating func addPiece(col : Int, row : Int, id : Int) -> (Bool, Int, Int){
        if col > nbCol-1 || col < 0 || row > nbRows-1 || row < 0 || grid[row][col] != nil{
            return (false, 0, 0)
        }
		self.grid[row][col] = id
        return (true, col, row)
    }
    
    /*
    private mutating func removePiece(col: Int, row: Int, propageGravity : Bool = true){
        if col > nbCol-1 || col < 0 || row > nbRows-1 || row < 0 {
            return
        }
        self.grid[row][col] = nil
        if propageGravity{
            
            // TODO
            
        }
    }
     */
    
}
