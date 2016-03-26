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
    var randomHealthStart: UInt32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomHealthStart = arc4random_uniform(50) + 150
        
        playerPo = Po(charName: "Po", hp: Int(randomHealthStart), attPwr: 32, charGraphic: "po")
        
        
        playerANameALabel.text = "Player \(playerPo.name)"
        playerAHealthLabel.text = "Health: \(playerPo.hp)"
        playerACurrentAttPwr.text = "AttPwr: \(playerPo.poRandomNumber)"
    
        
    }
    //Actions
    @IBAction func showRndQuoate(sender: AnyObject) {
        quotes = playerPo.showFunPhrase()
        playerACurrentAttPwr.text = "AttPwr: \(playerPo.makeRandAttPwrNumber())"
        randomQuoteMessage.text = "\(quotes!)"
    }

}

