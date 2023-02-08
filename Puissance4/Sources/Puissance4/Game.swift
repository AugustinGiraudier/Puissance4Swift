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

    ///
    /// Lance la boucle de jeu avec les joueurs ajoutés à la partie
    public mutating func play(){
        
        // boucle de jeu
        var winner = (false, "")
        var grideFull = false
        while !grideFull, !winner.0 {
            for i in 0..<players.count {
                var oCol : Int? = nil
                var pieceAdded = (false, 0, 0)
                displaygrid()
                while !pieceAdded.0 {
                    oCol = players[i].chooseColumn(withGrid: grid, andRules: rules)
                    if oCol == nil {
                        continue
                    }
                    pieceAdded = grid.addPiece(col: oCol!, id: players[i].id)
                }
                // verif du gagnant
                winner = (rules.checkWinner(grid: grid, lastInserted: (pieceAdded.1, pieceAdded.2)),players[i].name)
                grideFull = grid.isFull()
                if winner.0 || grideFull{
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
    }

    ///
    /// Ajoute un joueur à la partie, verifie l'unicité de son id et map son symbol
    /// - Parameter player: joueur à ajouter
    /// - Returns:true si le joueur a pu etre ajouté sinon false
    private mutating func addPlayer(player : Player) -> Bool{
        guard players.allSatisfy({$0.id != player.id}) else{
            return false
        }
        players.append(player)
        symbolMapper[player.id] = player.symbol
        return true
    }

    ///
    /// Affiche la grille en cours
    public func displaygrid(){
        gridDisplayer(grid, symbolMapper)
    }
    
    
    
}
