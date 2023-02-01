//
//  ConsoleDisplayer.swift
//  
//
//  Created by Augustin Giraudier on 19/01/2023.
//

import Foundation

public struct ConsoleDisplayer : Displayer{
    
    public init(){}
    
    public func displaygrid(_ grid: Grid, withSymbolMapper mapper: Dictionary<Int?, String?>? = nil)
    {
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
    
    
    
}
