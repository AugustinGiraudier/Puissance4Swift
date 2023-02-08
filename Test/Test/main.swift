//
//  main.swift
//  Test
//
//  Created by etudiant on 08/02/2023.
//

// delegates    x
// extentions   x
// generecite   x
// equatable    x



import Foundation

print("Hello, World!")

enum test{
    case JHVJHGJG,
    case maBite
}

class Mouton<T>{
    
    private let name : T;
    

    public init(name : T){
        self.name = name
    }
    
    
    public func run(){
        print(name)
    }
}


var mout = Mouton<String>(name: "test")
mout.run()
