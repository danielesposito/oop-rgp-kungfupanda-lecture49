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
    @IBOutlet weak var playerAButton: UIButton!
    @IBOutlet weak var randQuotesBtn: UIButton!
    //Variables
    var playerPo: Po!
    var quotes: String?
    var randomHealthStart: UInt32 = 0
    var randomAttackPwrPlayerA: UInt32 = 0
    var setRandAttackPwrPlayerA: UInt32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerPo = Po(charName: "Po", hp: 0, attPwr: 0, charGraphic: "po")
        
        playerPo.makeRandAttPwrNumber()
        playerPo.makeRandHealthPwrNumber()
        
        randomHealthStart = playerPo.randomHealthNumber
        randomAttackPwrPlayerA = playerPo.randomAttckNumber
        
        playerAHealthLabel.text = "Health: \(Int(randomHealthStart))"
        playerACurrentAttPwr.text = "Attack Pwr: \(Int(randomAttackPwrPlayerA))"
        
        playerAButton.setTitle("Attack with \(randomAttackPwrPlayerA) PWR", forState: UIControlState.Normal)
        playerANameALabel.text = "Player \(playerPo.name)"
        playerPo = Po(updateHp: Int(randomHealthStart), updAttPwr: Int(randomAttackPwrPlayerA))
  
}
    //Actions
    @IBAction func showRndQuoate(sender: AnyObject) {
        quotes = playerPo.showFunPhrase()
        
        setRandAttackPwrPlayerA = makeRandNumbersPlayerA()
        playerACurrentAttPwr.text = "AttPwr: \(setRandAttackPwrPlayerA)"
        playerAButton.setTitle("Attack with \(setRandAttackPwrPlayerA) PWR", forState: UIControlState.Normal)
        randomQuoteMessage.text = "\(quotes!)"
        
        if playerPo.attemptAttack(Int(setRandAttackPwrPlayerA)) {
            playerAHealthLabel.text = "Health: \(playerPo.hp)"
        } else {
            print("No")
        }
        
        if !playerPo.isAlive {
            playerAButton.enabled = false
            randQuotesBtn.enabled = false
            playerAButton.setTitle("YOU DIED!", forState: UIControlState.Normal)
        }

}
    func makeRandNumbersPlayerA() -> UInt32 {
        randomAttackPwrPlayerA = playerPo.makeRandAttPwrNumber()
        return randomAttackPwrPlayerA
    }

}

