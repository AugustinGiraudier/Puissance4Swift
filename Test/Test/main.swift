//
//  main.swift
//  Test
//
//  Created by etudiant on 08/02/2023.
//

import Foundation

print("Hello, World!")


class Mouton{
    
    private let displayfunc : (String,Int) -> Int
    
    public init(function : @escaping (String, Int) -> Int){
        self.displayfunc = function
    }
    
    public func run(){
        let result = displayfunc("toto", 1)
        print(result)
    }
    
}

let mout = Mouton(function: { v1, v2 in
    print("\(v1): \(v2)")
    return Int.random(in: 0...10)
})

mout.run()
