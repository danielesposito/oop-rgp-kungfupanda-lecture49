//
//  Po.swift
//  rgp-ooc-game-assigment
//
//  Created by Daniel Esposito on 3/25/16.
//  Copyright © 2016 Daniel Esposito. All rights reserved.
//

import Foundation

class Po: Character {
    
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