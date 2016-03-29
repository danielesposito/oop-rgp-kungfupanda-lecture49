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
    //    private var _bonusName: String = "N"
    //    private var _bonusScore: Int = 0
    
    var randomAttckNumber: UInt32 = 0
    var randomHealthNumber: UInt32 = 0
    
    
    
    var funPhrases: [String] {
        return ["Who are you?", "You lost your son?"]
    }
    
    var diedPhrases: [String] {
        
        return ["Noooo ... I dont want to be dead!!"]
    }
    
    
    //    init(wonBonusName: String, wonBonusAmount: Int) {
    //
    //        _bonusName = wonBonusName
    //        _bonusScore = wonBonusAmount
    //    }
    
    struct bonusHpStructure {
        
        var bonusName: String = "l"
        var  bonusScore: Int = 0
        
    }
    
    let fightBonus1 = bonusHpStructure(bonusName: "Sun Star", bonusScore: 2)
    let fightBonus2 = bonusHpStructure(bonusName: "Fire Ball", bonusScore: 5)
    let fightBonus3 = bonusHpStructure(bonusName: "NoBonus", bonusScore: 0)
    let fightBonus4 = bonusHpStructure(bonusName: "Lobster Legs", bonusScore: 7)
    let fightBonus5 = bonusHpStructure(bonusName: "Bamboo Ball", bonusScore: 9)
    let fightBonus6 = bonusHpStructure(bonusName: "Golden Egg", bonusScore: 11)
    let fightBonus7 = bonusHpStructure(bonusName: "Onyx Cylinder", bonusScore: 13)
    let fightBonus8 = bonusHpStructure(bonusName: "SunStar", bonusScore: 20)
    
    
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
        let rand = Int(arc4random_uniform(100)+1)
            if rand % 3 == 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(bonusHpItems.count)))
                return bonusHpItems[randomIndex]
            } else {
                let randomIndex = Int(2)
                return bonusHpItems[randomIndex]
        }
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
    
    func makeRandAttPwrNumber() -> UInt32 {
        randomAttckNumber = arc4random_uniform(60) + 1
        if randomAttckNumber <= 10 {
            randomAttckNumber = arc4random_uniform(60) + 1
        }
        return randomAttckNumber
    }
    
    func makeRandHealthPwrNumber() -> UInt32 {
        randomHealthNumber = arc4random_uniform(350) + 100
        return randomHealthNumber
    }
    
    func collectBonushealth(bonusHp: Int){
        self._hp = bonusHp
        //        return true
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