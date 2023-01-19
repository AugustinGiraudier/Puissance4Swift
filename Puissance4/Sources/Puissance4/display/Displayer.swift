//
//  Displayer.swift
//  
//
//  Created by Augustin Giraudier on 19/01/2023.
//

import Foundation


public protocol Displayer{
    
    func displayGride(_ gride: Gride, withSymbolMapper mapper: Dictionary<Int?, String?>?)
    
}
