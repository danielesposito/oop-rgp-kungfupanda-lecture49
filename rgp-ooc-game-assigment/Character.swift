//
//  Character.swift
//  rgp-ooc-game-assigment
//
//  Created by Daniel Esposito on 3/25/16.
//  Copyright © 2016 Daniel Esposito. All rights reserved.
//

import Foundation


class Character {
    
    
    private var _hp: Int = 0
    private var _attackPwr: Int = 10
    private var _graphic: String = "po"
    private var _name: String = "Po"
    var randomAttckNumber: UInt32 = 0
    var randomHealthNumber: UInt32 = 0
    
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
    
    init(charName: String, hp: Int, attPwr: Int, charGraphic: String) {
        
        _name = charName
        _hp = hp
        _attackPwr = attPwr
        _graphic = charGraphic
    }
    
    init(updateHp: Int, updAttPwr: Int) {
        
        _hp = updateHp
        _attackPwr = updAttPwr
    }

    init(updAttPwr: Int) {
        
        _attackPwr = updAttPwr
    }
    
    init(updateHp: Int) {
        
        _hp = updateHp
    }
    
    func showFunPhrase() -> String? {
        
        if funPhrases.count > 0 {
        
            let funnyPhrase = Int(arc4random_uniform(UInt32(funPhrases.count)))
            return funPhrases[funnyPhrase]
        
        } else {
            
            return "Nothing to Quote"
        }
    }
    
    func makeRandAttPwrNumber() -> UInt32 {
        
        randomAttckNumber = arc4random_uniform(50) + 1
        return randomAttckNumber
    }
    
    func makeRandHealthPwrNumber() -> UInt32 {
        
        randomHealthNumber = arc4random_uniform(350) + 100
        return randomHealthNumber
        
    }
    
    func attemptAttack(attackPwr: Int) -> Bool {
        
        self._hp -= attackPwr
        
        return true
    }
    
    var isAlive: Bool {
        
        get {
            
            if hp <= 0 {
                
                return false
                
            } else {
                
                return true
            }
            
        }
    }
}