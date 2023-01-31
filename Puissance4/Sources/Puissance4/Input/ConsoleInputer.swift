//
//  ConsoleInputer.swift
//  
//
//  Created by Augustin Giraudier on 31/01/2023.
//

import Foundation

public struct ConsoleInputer : Inputer{
    
    public func nextInt() -> Int? {
        let str = readLine() ?? ""
        return Int(str)
    }
    
    public func nextString() -> String {
        return readLine() ?? ""
    }
    
}
