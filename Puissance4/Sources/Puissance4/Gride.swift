//
//  Gride.swift
//  
//
//  Created by Augustin Giraudier on 17/01/2023.
//

import Foundation


public struct Gride{
    
    // ---- datas ---- //
    
    private var gride : [[Int?]]
    public let nbRows : Int
    public let nbCol : Int
    
    // ---- init ---- //
    
    public init?(nbRows: Int = 6, nbCol: Int = 7) {
        guard nbRows > 0 && nbCol > 0 else{
            return nil
        }
        self.nbRows = nbRows
        self.nbCol = nbCol
        self.gride = Array(repeating: Array(repeating: nil, count: nbCol), count: nbRows)
    }
    
    // ---- public methodes ---- //
    
    public subscript(col: Int, row : Int) -> Int? {
        get {
            if col > nbCol-1 || col < 0 || row > nbRows-1 || row < 0{
                return nil
            }
            return gride[row][col]
        }
    }
    
    public mutating func addPiece(col : Int, id: Int) -> Bool{
        if col > nbCol-1 || col < 0{
            return false
        }
        var iRow : Int = nbRows-1
        while !addPiece(col: col, row: iRow, id: id) && iRow >= 0{
            iRow-=1
        }
        return  iRow != -1
    }
    
    public func isFull() -> Bool{
        for iRow in gride{
            for iCol : Int? in iRow{
                if iCol == nil{
                    return false
                }
            }
        }
        return true
    }
    
    // ---- private methodes ---- //
    
    private mutating func addPiece(col : Int, row : Int, id : Int) -> Bool{
        if col > nbCol-1 || col < 0 || row > nbRows-1 || row < 0 || gride[row][col] != nil{
            return false
        }
		self.gride[row][col] = id
        return true
    }
    
    private mutating func removePiece(col: Int, row: Int, propageGravity : Bool = true){
        if col > nbCol-1 || col < 0 || row > nbRows-1 || row < 0 {
            return
        }
        self.gride[row][col] = nil
        if propageGravity{
            
            // TODO
            
        }
    }
    
}
