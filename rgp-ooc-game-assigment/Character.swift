//
//  Character.swift
//  rgp-ooc-game-assigment
//
//  Created by Daniel Esposito on 3/25/16.
//  Copyright © 2016 Daniel Esposito. All rights reserved.
//

import Foundation


class Character {
    
    private var _hpPlayer1: Int = 0
    private var _hpPlayer2: Int = 0
    private var _attackPwrPlayer1: Int = 0
    private var _attackPwrPlayer2: Int = 0
    
    private var _graphic: String = "po"
    private var _name: String = "Po"
    
    var randomAttckNumber: UInt32 = 0
    var randomHealthNumber: UInt32 = 0
    
    
    var funPhrases: [String] {
        return ["Who are you?", "You lost your son?"]
    }
    
    var diedPhrases: [String] {
        
        return ["Noooo ... I dont want to be dead!!"]
    }

    
    struct bonusHpStructure {
        
       var bonusName: String = ""
       var bonusScore: Int = 0
        
    }
    
    let fightBonus1 = bonusHpStructure(bonusName: "Sun Star", bonusScore: 10)
    let fightBonus2 = bonusHpStructure(bonusName: "Fire Ball", bonusScore: 15)
    let fightBonus3 = bonusHpStructure(bonusName: "Nada", bonusScore: 0)
    let fightBonus4 = bonusHpStructure(bonusName: "Lobster Lega", bonusScore: 20)
    let fightBonus5 = bonusHpStructure(bonusName: "Bamboo Ball", bonusScore: 25)
    let fightBonus6 = bonusHpStructure(bonusName: "Golden Goose Egg", bonusScore: 30)
    let fightBonus7 = bonusHpStructure(bonusName: "Onyx Cylinder", bonusScore: 35)
    let fightBonus8 = bonusHpStructure(bonusName: "SunStar", bonusScore: 50)
    
    
    var bonusHpItems : [(String,Int)] {
        get {
            
            return [
                (fightBonus1.bonusName, fightBonus1.bonusScore),
                (fightBonus2.bonusName, fightBonus2.bonusScore),
                (fightBonus3.bonusName, fightBonus3.bonusScore),
                (fightBonus4.bonusName, fightBonus4.bonusScore),
                (fightBonus5.bonusName, fightBonus5.bonusScore),
                (fightBonus6.bonusName, fightBonus6.bonusScore),
                (fightBonus7.bonusName, fightBonus7.bonusScore),
                (fightBonus8.bonusName, fightBonus8.bonusScore)]
        }
        
    }

    func foundBonusHealth() -> (bonusName: String, bonusScore: Int)
    {
        let randomIndex = Int(arc4random_uniform(UInt32(bonusHpItems.count)))
        return bonusHpItems[randomIndex]
        
    }
    
    var name: String {
        get {
            return _name
        }
    }
 
    var hpPlayer1: Int {
        get {
            return _hpPlayer1
        }
    }
    var hpPlayer2: Int {
        get {
            return _hpPlayer2
        }
    }
    var attackPwrPlayer1: Int {
        get {
            return _attackPwrPlayer1
        }
    }
    var attackPwrPlayer2: Int {
        get {
            return _attackPwrPlayer2
        }
    }

    var graphic: String {
        get {
            return _graphic
        }
    }

    init(charName: String, hpPlayer1: Int, attPwrPlayer1: Int, charGraphic: String) {
        _name = charName
        _hpPlayer1 = hpPlayer1
        _attackPwrPlayer1 = attPwrPlayer1
        _graphic = charGraphic
    }
    
    init(charName: String, hpPlayer2: Int, attPwrPlayer2: Int, charGraphic: String) {
        _name = charName
        _hpPlayer2 = hpPlayer2
        _attackPwrPlayer2 = attPwrPlayer2
        _graphic = charGraphic
    }
    
    init(updateHpPlayer1: Int, updAttPwrPlayer1: Int) {
        _hpPlayer1 = updateHpPlayer1
        _attackPwrPlayer1 = updAttPwrPlayer1
    }
    
    init(updateHpPlayer2: Int, updAttPwrPlayer2: Int) {
        _hpPlayer2 = updateHpPlayer2
        _attackPwrPlayer2 = updAttPwrPlayer2
    }
    
    func showFunPhrase() -> String? {
        if funPhrases.count > 0 {
            let funnyPhrase = Int(arc4random_uniform(UInt32(funPhrases.count)))
            return funPhrases[funnyPhrase]
        } else {
            return "Nothing to say. I am bored!"
        }
    }
    
    func randDidDiePhrases() -> String {
        if diedPhrases.count > 0 {
            let diePhrase = Int(arc4random_uniform(UInt32(diedPhrases.count)))
            return diedPhrases[diePhrase]
        } else {
            return "Good bye cruel World"
        }
    }
    
    func collectBonushealthPlayer1(bonusHpPlayer1: Int){
        self._hpPlayer1 = self._hpPlayer1 + bonusHpPlayer1
        print("Char: Current HP Player 1: \(_hpPlayer1)")
    }
    
    func collectBonushealthPlayer2(bonusHpPlayer2: Int){
        self._hpPlayer2 = self._hpPlayer2 + bonusHpPlayer2
        print("Char: Current HP Player 2: \(_hpPlayer2)")
    }
    
    func makeRandAttPwrNumber() -> UInt32 {
        randomAttckNumber = arc4random_uniform(50) + 1
        return randomAttckNumber
    }
    
    func makeRandHealthPwrNumber() -> UInt32 {
        randomHealthNumber = arc4random_uniform(350) + 100
        return randomHealthNumber
    }
    
    func attemptAttackPlayer1(attackPwrPlayer2: Int) {
        self._hpPlayer1 -= attackPwrPlayer2
    }
    
    func attemptAttackPlayer2(attackPwrPlayer1: Int) {
        self._hpPlayer2 -= attackPwrPlayer1
    }
    var isAlivePlayer1: Bool {
        get {
            if hpPlayer1 <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    var isAlivePlayer2: Bool {
        get {
            if hpPlayer2 <= 0 {
                return false
            } else {
                return true
            }
        }
    }
}