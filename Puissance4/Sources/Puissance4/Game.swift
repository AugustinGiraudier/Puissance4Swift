//
//  Game.swift
//  
//
//  Created by Augustin Giraudier on 17/01/2023.
//

import Foundation


public struct Game{
    
    private var grid : Grid
    private var players : [Player]
    private let displayer : Displayer
    private var symbolMapper : [Int?:String?]
    
    public init(withgrid grid: Grid, andDisplayer displayer: Displayer? = nil) {
        self.grid = grid
        players = Array()
        if let disp=displayer{
            self.displayer = disp
        }
        else{
            self.displayer = ConsoleDisplayer()
        }
        symbolMapper = [:]
    }
    
    private mutating func addPlayer(player : Player) -> Bool{
        guard players.allSatisfy({$0.id != player.id}) else{
            return false
        }
        players.append(player)
        symbolMapper[player.id] = player.symbol
        return true
    }
    
    public func displaygrid(){
        displayer.displaygrid(grid, withSymbolMapper: symbolMapper)
    }
    
}
