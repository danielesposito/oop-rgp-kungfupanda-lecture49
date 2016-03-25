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
    
    
    
    
    //Variables
    
    var playerPo: Po!
    var quotes: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerPo = Po(charName: "Po", charHp: 98, charAttackPwr: 32, charGraphic: "po")
        
        
    }

    @IBAction func showRndQuoate(sender: AnyObject) {
        quotes = playerPo.showFunPhrase()
        randomQuoteMessage.text = "\(quotes!)"
    }

}

