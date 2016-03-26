//
//  ViewController.swift
//  rgp-ooc-game-assigment
//
//  Created by Daniel Esposito on 3/25/16.
//  Copyright © 2016 Daniel Esposito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var randomQuoteMessage: UILabel!
    @IBOutlet weak var playerANameALabel: UILabel!
    @IBOutlet weak var playerAHealthLabel: UILabel!
    @IBOutlet weak var playerACurrentAttPwr: UILabel!
    @IBOutlet weak var playerNameBLabel: UILabel!
    
    
    
    //Variables
    var playerPo: Po!
    var quotes: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerPo = Po(charName: "Po", hp: 98, attPwr: 32, charGraphic: "po")
        
        
        playerANameALabel.text = "Player \(playerPo.name)"
        playerAHealthLabel.text = "Health: \(playerPo.hp)"
        playerACurrentAttPwr.text = "AttPwr: \(playerPo.randomNumber)"
    
        
    }
    //Actions
    @IBAction func showRndQuoate(sender: AnyObject) {
        quotes = playerPo.showFunPhrase()
        playerACurrentAttPwr.text = "AttPwr: \(playerPo.makeRandAttPwrNumber())"
        randomQuoteMessage.text = "\(quotes!)"
    }

}

