//
//  RobotPlayer.swift
//  
//
//  Created by Augustin Giraudier on 01/02/2023.
//

import Foundation

public class RobotPlayer : Player{
    
    public let sleepingTime : UInt32
    
    public override init?(withid id: Int, andName name: String, displayedAs symbol: String? = nil, displayFunc: @escaping (String) -> Void, inputIntFunc: @escaping () -> Int?) {
        self.sleepingTime = 2
        super.init(withid: id, andName: name, displayedAs: symbol, displayFunc: displayFunc, inputIntFunc: inputIntFunc)
    }
    
    public init?(withid id: Int, andName name: String, displayedAs symbol: String? = nil, displayFunc: @escaping (String) -> Void, inputIntFunc: @escaping () -> Int?, sleepingTime : UInt32) {
        self.sleepingTime = sleepingTime
        super.init(withid: id, andName: name, displayedAs: symbol, displayFunc: displayFunc, inputIntFunc: inputIntFunc)
    }

    ///
    /// Retourne la colonne choisie par le joueur Robot
    /// - Parameters:
    ///   - grid: grille actuelle
    ///   - rules: regles du jeu
    /// - Returns:l'index de la colonne ou jouer
    public override func chooseColumn(withGrid grid : Grid, andRules rules : Rules) -> Int? {
        display("Robot is thinking...")
        var g = grid
        sleep(self.sleepingTime)
        for i in (0..<g.nbCol).shuffled() {
            if g.addPiece(col: i, id: 0).0 {
                return i
            }
        }
        return nil
    }
    
    
}
