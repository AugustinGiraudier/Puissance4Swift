//
//  Game.swift
//  
//
//  Created by Augustin Giraudier on 17/01/2023.
//

import Foundation


public struct Game{
    
    public private(set) var grid : Grid
    private let rules : Rules
    private var players : [Player]
    
    private let gridDisplayer : (Grid, Dictionary<Int?, String?>?) -> Void
    internal let display : (String) -> Void
    
    private var symbolMapper : [Int?:String?]
    
    public init?(withgrid grid: Grid,
                 andRules rules : Rules,
                 andGridDisplayFunc gridDisplayer: @escaping (Grid, Dictionary<Int?, String?>?) -> Void,
                 displayFunc : @escaping (String)-> Void,
                 players : [Player]
                 ) {
        
        // verif grids
        guard rules.gridRespectsRules(grid), players.count > 0, rules.nbPlayerRespectsRules(players.count) else { return nil }
        
        self.grid = grid
        self.rules = rules
        self.players = Array()
        self.symbolMapper = [:]
        
        self.gridDisplayer = gridDisplayer
        self.display = displayFunc
        self.players = []
      
        // randomize players order
        for i in (0..<players.count).shuffled() {
            guard addPlayer(player: players[i]) else {return nil}
        }
        
    }
    
    public mutating func play() -> EndGame{
        
        // boucle de jeu
        var winner = (false, "")
        while !grid.isFull(), !winner.0 {
            for i in 0..<players.count {
                var oCol : Int? = nil
                var pieceAdded = (false, 0, 0)
                displaygrid()
                display("\(players[i].name), it's your turn :")
                while !pieceAdded.0 {
                    oCol = players[i].chooseColumn(withGrid: grid, andRules: rules)
                    if oCol == nil {
                        continue
                    }
                    pieceAdded = grid.addPiece(col: oCol!, id: players[i].id)
                }
                // verif du gagnant
                if rules.checkWinner(grid: grid, lastInserted: (pieceAdded.1, pieceAdded.2)) {
                    winner = (true, players[i].name)
                    break
                }
            }
        }
        displaygrid()
        if winner.0 {
            display("Winner : \(winner.1) !")
        }
        else{
            display("The grid is full...")
        }
        
        return .GAME_ENDED
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
