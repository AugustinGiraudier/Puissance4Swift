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
    private let gridDisplayer : (Grid, Dictionary<Int?, String?>?) -> Void
    private var symbolMapper : [Int?:String?]
    
    public init(withgrid grid: Grid, andDisplayFunc displayer: @escaping (Grid, Dictionary<Int?, String?>?) -> Void) {
        self.grid = grid
        players = Array()
        gridDisplayer = displayer
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
        gridDisplayer(grid, symbolMapper)
    }
    
}
