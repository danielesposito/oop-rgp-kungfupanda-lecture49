//
//  Character.swift
//  rgp-ooc-game-assigment
//
//  Created by Daniel Esposito on 3/25/16.
//  Copyright © 2016 Daniel Esposito. All rights reserved.
//

import Foundation


class Character {
    
    
    private var _hp: Int = 10
    private var _attackPwr: Int = 10
    private var _graphic: String = "po"
    private var _name: String = "Po"
    
    
    var funPhrases: [String] {
        
        return ["Who are you?", "You lost your son?"]
    }
    
    var name: String {
        get {
            return _name
        }
    }
 
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var graphic: String {
        get {
            return _graphic
        }
    }
    
    init(charName: String, charHp: Int, charAttackPwr: Int, charGraphic: String) {
        
        _name = charName
        _hp = charHp
        _attackPwr = charAttackPwr
        _graphic = charGraphic
    }
    
    func showFunPhrase() -> String? {
        
        if funPhrases.count > 0 {
        
            let funnyPhrase = Int(arc4random_uniform(UInt32(funPhrases.count)))
            return funPhrases[funnyPhrase]
        
        } else {
            
            return "Nothing to Quote"
        }
    }
}