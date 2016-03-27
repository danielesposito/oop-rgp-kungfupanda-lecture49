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
    @IBOutlet weak var playerANameLabel: UILabel!
    @IBOutlet weak var playerAHealthLabel: UILabel!
    @IBOutlet weak var playerACurrentAttPwr: UILabel!
    @IBOutlet weak var playerAButton: UIButton!
    @IBOutlet weak var resetGamePlayBtn: UIButton!
    
    @IBOutlet weak var playerBNameLabel: UILabel!
    @IBOutlet weak var playerBHealthLabel: UILabel!
    @IBOutlet weak var playerBCurrentAttPwr: UILabel!
    @IBOutlet weak var playerBButton: UIButton!
    
    //Variables
    //Player A
    var playerPo: Po!
    var quotesPo: String?
    var diePhrasePo: String?
    var randomHealthStartPlayerA: UInt32 = 0
    var randomAttackPwrPlayerA: UInt32 = 0
    var setRandAttackPwrPlayerA: UInt32 = 0
    //Player B
    var playerShifu: Mastershifu!
    var quotesShifu: String?
    var diePhraseShifu: String?
    var randomHealthStartPlayerB: UInt32 = 0
    var randomAttackPwrPlayerB: UInt32 = 0
    var setRandAttackPwrPlayerB: UInt32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareGamePlay()
        
}
    //Actions
    @IBAction func playerPoAttackButtonPressed(sender: AnyObject) {
        
        
        playerShifu.attemptAttack(Int(randomAttackPwrPlayerA))
        
            if playerShifu.hp <= 0 {
                playerBHealthLabel.text = "Health: 0"
            } else {
                playerBHealthLabel.text = "Health: \(playerShifu.hp)"
            }
        quotesPo = playerPo.showFunPhrase()
        randomQuoteMessage.text = "\"\(quotesPo!)\""
        setNewPlayerAValues()

        if !playerShifu.isAlive {
            
            diePhraseShifu = playerShifu.randDidDiePhrases()
            randomQuoteMessage.text = "\"\(diePhraseShifu!)\""
            playerBButton.enabled = false
            playerBButton.setTitle("YOU DIED!", forState: UIControlState.Normal)
            
            // Set button state for Winner Player A
            playerAButton.enabled = false
            playerAButton.setTitle("YOU WON!!!!", forState: UIControlState.Normal)
            resetGamePlayBtn.hidden = false
        }
}
    
    @IBAction func playerBAttackButtonPressed(sender: AnyObject) {
        playerPo.attemptAttack(Int(randomAttackPwrPlayerB))
        if playerPo.hp <= 0 {
            playerAHealthLabel.text = "Health: 0"
        } else {
            playerAHealthLabel.text = "Health: \(playerPo.hp)"
        }
        
        quotesShifu = playerShifu.showFunPhrase()
        randomQuoteMessage.text = "\"\(quotesShifu!)\""
        setNewPlayerBValues()
        
        if !playerPo.isAlive {
            diePhrasePo = playerPo.randDidDiePhrases()
            randomQuoteMessage.text = "\"\(diePhrasePo!)\""
            playerAButton.enabled = false
            playerAButton.setTitle("YOU DIED!", forState: UIControlState.Normal)
            
            //Set button state for Winner Player B
            playerBButton.enabled = false
            playerBButton.setTitle("YOU WON!!", forState: UIControlState.Normal)
            resetGamePlayBtn.hidden = false
        }
        
    }
    
    @IBAction func resetGameBtnPressed(sender: AnyObject) {
        prepareGamePlay()
        setNewPlayerAValues()
        setNewPlayerBValues()
    }
    
    func prepareGamePlay() {
        
        randomQuoteMessage.text = ""
        resetGamePlayBtn.hidden = true

        //Initialize Player A
        playerPo = Po(charName: "Po", hp: 0, attPwr: 0, charGraphic: "po")
        playerPo.makeRandAttPwrNumber()
        playerPo.makeRandHealthPwrNumber()
        //Initialize Player B
        playerShifu = Mastershifu(charName: "MasterShifu", hp: 0, attPwr: 0, charGraphic: "mastershifu")
        
        playerShifu.makeRandAttPwrNumber()
        playerShifu.makeRandHealthPwrNumber()
        //Player A - Set up random numbers
        randomHealthStartPlayerA = playerPo.randomHealthNumber
        randomAttackPwrPlayerA = playerPo.randomAttckNumber
        // Player B - Set up random numbers
        randomHealthStartPlayerB = playerShifu.randomHealthNumber
        randomAttackPwrPlayerB = playerShifu.randomAttckNumber
        
        //Player A - Update Score Menu & initializers
        playerAHealthLabel.text = "Health: \(Int(randomHealthStartPlayerA))"
        playerACurrentAttPwr.text = "Attack Pwr: \(Int(randomAttackPwrPlayerA))"
        
        playerAButton.setTitle("Attack with \(randomAttackPwrPlayerA) PWR", forState: UIControlState.Normal)
        playerANameLabel.text = "Player \(playerPo.name)"
        playerPo = Po(updateHp: Int(randomHealthStartPlayerA), updAttPwr: Int(randomAttackPwrPlayerA))
        //Player B - Update Score Menu & initializers
        playerBHealthLabel.text = "Health: \(Int(randomHealthStartPlayerB))"
        playerBCurrentAttPwr.text = "Attack Pwr: \(Int(randomAttackPwrPlayerB))"
        
        playerBButton.setTitle("Attack with \(randomAttackPwrPlayerB) PWR", forState: UIControlState.Normal)
        playerBNameLabel.text = "Player \(playerShifu.name)"
        playerShifu = Mastershifu(updateHp: Int(randomHealthStartPlayerB), updAttPwr: Int(randomAttackPwrPlayerB))
    }
    
    func makeRandNumbersPlayerA() -> UInt32 {
        randomAttackPwrPlayerA = playerPo.makeRandAttPwrNumber()
        return randomAttackPwrPlayerA
    }
    
    func makeRandNumbersPlayerB() -> UInt32 {
        randomAttackPwrPlayerB = playerShifu.makeRandAttPwrNumber()
        return randomAttackPwrPlayerB
    }
    
    func setNewPlayerAValues() {
        setRandAttackPwrPlayerA = makeRandNumbersPlayerA()
        playerACurrentAttPwr.text = "AttPwr: \(setRandAttackPwrPlayerA)"
        playerAButton.setTitle("Attack with \(setRandAttackPwrPlayerA) PWR", forState: UIControlState.Normal)
        playerAButton.enabled = true
    }
    
    func setNewPlayerBValues() {
        setRandAttackPwrPlayerB = makeRandNumbersPlayerB()
        playerBCurrentAttPwr.text = "AttPwr: \(setRandAttackPwrPlayerB)"
        playerBButton.setTitle("Attack with \(setRandAttackPwrPlayerB)", forState: UIControlState.Normal)
        playerBButton.enabled = true
    }
    

}

