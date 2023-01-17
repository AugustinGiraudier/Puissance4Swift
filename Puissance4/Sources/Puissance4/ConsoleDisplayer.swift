//
//  File.swift
//  
//
//  Created by etudiant on 17/01/2023.
//

import Foundation

public struct ConsoleDisplayer : Displayer{
    
    public func displayGride(gride : Gride) {
        for iRow in 0...gride.NbRows-1{
            for iCol in 0...gride.NbCol-1{
                var char = " "
                if let c = gride[iCol, iRow]{
                    char = String(c)
                }
                print("|\(char)", terminator: "")
            }
            print("|")
        }
    }
    
}
