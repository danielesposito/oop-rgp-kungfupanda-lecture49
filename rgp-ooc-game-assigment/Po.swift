//
//  Po.swift
//  rgp-ooc-game-assigment
//
//  Created by Daniel Esposito on 3/25/16.
//  Copyright © 2016 Daniel Esposito. All rights reserved.
//

import Foundation

class Po: Character {
    
    
//    struct bonusHpStructure {
//        
//        var bonusName: String = "l"
//        var bonusScore: Int = 0
//        
//    }
//    
//    let fightBonus1 = bonusHpStructure(bonusName: "Sun Star", bonusScore: 100)
//    let fightBonus2 = bonusHpStructure(bonusName: "Fire Ball", bonusScore: 25)
//    let fightBonus3 = bonusHpStructure(bonusName: "Nada", bonusScore: 0)
//    let fightBonus4 = bonusHpStructure(bonusName: "Lobster Lega", bonusScore: 55)
//    let fightBonus5 = bonusHpStructure(bonusName: "Bamboo Ball", bonusScore: 100)
//    let fightBonus6 = bonusHpStructure(bonusName: "Golden Goose Egg", bonusScore: 150)
//    let fightBonus7 = bonusHpStructure(bonusName: "Onyx Cylinder", bonusScore: 85)
//    let fightBonus8 = bonusHpStructure(bonusName: "SunStar", bonusScore: 100)
//    
//    let dictionary = [fightBonus1.bonusName: fightBonus1,fightBonus2.bonusName: fightBonus2,fightBonus3.bonusName: fightBonus3,fightBonus4.bonusName: fightBonus4,fightBonus5.bonusName: fightBonus5,fightBonus6.bonusName: fightBonus6,fightBonus7.bonusName: fightBonus7,fightBonus8.bonusName: fightBonus8]
//    
//    func foundBonusHealth() -> (bonusName: String, bonusScore: Int)
//    {
//        let array = [bonusHpStructure](dictionary.values)
//        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
//        return (array[randomIndex].bonusName, array[randomIndex].bonusScore)
//        
//    }

    override var funPhrases: [String] {
        return ["Who are you?", "You lost your son?", "You must be Kai. Beast of vengeance, Maker of widows", "Augh! chit-chat", "Chitty-chitty-chat-chat, chat-chat-chat!", "Enemies of justice, prepare for...", "Are you kidding me?", "You don't even know kung fu!", "I think I just peed a little!", "Woah! What was that?", "There's no way I'm ever gonna be like you!","I will not let you destroy Oogway's memory!","I always knew I wasn't eating up to my full potential!","Am I the son of a panda?"]
    }
    
    override var diedPhrases: [String] {
        
        return ["I Failed you all, forgive me","I hope the new world will welcome me", "I will haunt you in your dreams, muahahahaha", "My friends will revenge me", "This must be a terrible mistake"]
    }

    override var name: String {
        return "Po"
    }
    
    override var graphic: String {
        return "po"
    }
   
}