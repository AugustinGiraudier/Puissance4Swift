//
//  HumanPlayer.swift
//  
//
//  Created by Augustin Giraudier on 01/02/2023.
//

import Foundation


public class HumanPlayer : Player{
    
    public override init?(withid id: Int, andName name: String, displayedAs symbol: String? = nil, displayFunc: @escaping (String) -> Void, inputIntFunc: @escaping () -> Int?) {
        super.init(withid: id, andName: name, displayedAs: symbol, displayFunc: displayFunc, inputIntFunc: inputIntFunc)
    }

    ///
    /// Retourne la colonne choisie par le joueur humain
    /// - Parameters:
    ///   - grid: grille actuelle
    ///   - rules: regles du jeu
    /// - Returns:l'index de la colonne ou jouer
    public override func chooseColumn(withGrid grid : Grid, andRules rules : Rules) -> Int? {
        display("\(name), choose a column Number : ")
        return getIntInput()
    }
    
    
}
