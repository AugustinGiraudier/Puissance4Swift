//
//  IOFunctions.swift
//  
//
//  Created by Augustin Giraudier on 01/02/2023.
//

import Foundation


public func consoleDisplaygrid(_ grid: Grid, withSymbolMapper mapper: Dictionary<Int?, String?>? = nil)
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

public func consoleNextString() -> String {
    return readLine() ?? ""
}

public func consoleNextInt() -> Int? {
    let str = readLine() ?? ""
    return Int(str)
}

public func displayMsg(msg : String){
    print(msg)
}
