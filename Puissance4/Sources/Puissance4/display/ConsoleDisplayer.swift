//
//  ConsoleDisplayer.swift
//  
//
//  Created by Augustin Giraudier on 19/01/2023.
//

import Foundation

public struct ConsoleDisplayer : Displayer{
    
    public init(){}
    
    public func displayGride(_ gride: Gride, withSymbolMapper mapper: Dictionary<Int?, String?>? = nil)
    {
        for iRow in 0...gride.nbRows-1{
            for iCol in 0...gride.nbCol-1{
                var char = " "
                if let map = mapper, let symbol = map[gride[iCol, iRow]], let s=symbol{
                    char = s
                }
                else if let id = gride[iCol, iRow]{
                    char = String(id)
                }
                print("|\(char)", terminator: "")
            }
            print("|")
        }
    }
    
    
    
}
