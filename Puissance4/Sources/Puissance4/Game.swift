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
    internal let getIntInput : () -> Int?
    internal let getStrInput : () -> String
    
    private var symbolMapper : [Int?:String?]
    
    public init?(withgrid grid: Grid,
                 andRules rules : Rules,
                 andGridDisplayFunc gridDisplayer: @escaping (Grid, Dictionary<Int?, String?>?) -> Void,
                 displayFunc : @escaping (String)-> Void,
                 inputIntFunc : @escaping ()-> Int?,
                 inputStrFunc : @escaping ()-> String
                 ) {
        
        // verif grids
        guard rules.gridRespectsRules(grid) else { return nil }
        
        self.grid = grid
        self.rules = rules
        self.players = Array()
        self.symbolMapper = [:]
        
        self.gridDisplayer = gridDisplayer
        self.display = displayFunc
        self.getIntInput = inputIntFunc
        self.getStrInput = inputStrFunc
        
    }
    
    public mutating func play() -> EndGame{
        
        // ajout des players
        guard initPlayers() else { return .PLAYER_CANNOT_BE_CREATED }
        
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
    
    private mutating func initPlayers() -> Bool{
        // creation du joueur 1
        let oj1 = HumanPlayer(withid: 0, andName: "J1", displayedAs: "X", displayFunc: display, inputIntFunc: getIntInput, inputStrFunc: getStrInput)
        
        // ajout
        guard let j1 = oj1, addPlayer(player: j1) else { return false }
        
        // creation du joueur 2
        var input : Int? = nil
        while input == nil {
            display("What type of second player do you want ?")
            display(" 1 - play with a friend")
            display(" 2 - play against a robot")
            input = getIntInput()
            guard input != nil else {continue}
            switch(input!){
            case 1:
                let player = HumanPlayer(withid: players.count, andName: "J\(players.count+1)", displayedAs: "O", displayFunc: display, inputIntFunc: getIntInput, inputStrFunc: getStrInput)
                guard player != nil, addPlayer(player: player!) else { return false }
            case 2:
                let player = RobotPlayer(withid: players.count, andName: "J\(players.count+1)", displayedAs: "O", displayFunc: display, inputIntFunc: getIntInput, inputStrFunc: getStrInput)
                guard player != nil, addPlayer(player: player!) else { return false }
            default:
                input = nil
                break
            }
        }

        
        
        return true
    }
    
    public func displaygrid(){
        gridDisplayer(grid, symbolMapper)
    }
    
    
    
}
